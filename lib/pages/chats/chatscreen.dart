import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:ugnet/Utils/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.chat}) : super(key: key);
  final ChatTile chat;
  @override
  ChatScreenPageState createState() => ChatScreenPageState();
}

class ChatScreenPageState extends State<ChatScreen> {
  List<types.Message> messages = [];
  @override
  void initState() {
    super.initState();
    messages = widget.chat.messages;
  }

  randomString() {
    var random = Random.secure();
    var values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  void _addMessage(types.Message message) {
    setState(() {
      messages.insert(0, message);
    });
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );
      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );
    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (messages[index] as types.TextMessage).copyWith(previewData: previewData);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 2.0,
      ),
      body: Chat(
        theme: DefaultChatTheme(
            inputBorderRadius: BorderRadius.circular(20.0),
            inputTextColor: (Theme.of(context).textTheme.titleMedium?.color)!,
            inputTextCursorColor:
                (Theme.of(context).textTheme.titleMedium?.color)!,
            inputTextStyle: (Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontStyle: FontStyle.normal))!,
            inputBackgroundColor: Theme.of(context).backgroundColor,
            inputTextDecoration: InputDecoration(
                constraints: const BoxConstraints(
                  minHeight: 10.0,
                  maxHeight: 70.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  gapPadding: 2.0,
                  borderSide: const BorderSide(color: Colors.transparent),
                )),
            inputPadding: const EdgeInsets.all(2.0),
            attachmentButtonMargin: EdgeInsets.zero,
            inputContainerDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20.0)),
            sentMessageBodyTextStyle: (Theme.of(context).textTheme.titleSmall)!,
            emptyChatPlaceholderTextStyle:
                (Theme.of(context).textTheme.titleSmall)!,
            backgroundColor: Theme.of(context).backgroundColor,
            primaryColor: Theme.of(context).primaryColor,
            messageInsetsHorizontal: 6.0,
            messageInsetsVertical: 6.0,
            deliveredIcon: const Icon(Icons.check_circle_outline_outlined),
            dateDividerMargin: const EdgeInsets.only(bottom: 8.0, top: 4.0),
            dateDividerTextStyle: (Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 8.0))!,
            errorIcon: const Icon(Icons.error_outline, color: Colors.red),
            messageBorderRadius: 10.0,
            seenIcon: const Icon(Icons.check_circle_outline_outlined,
                color: Colors.greenAccent),
            sendingIcon: const Icon(Icons.access_time_sharp),
            attachmentButtonIcon: Transform.rotate(
                angle: -pi / 4,
                child: Icon(
                  Icons.attachment_outlined,
                  color: (Theme.of(context).textTheme.titleSmall?.color)!,
                  size: 15.0,
                ))),
        messages: messages,
        onAttachmentPressed: _handleAtachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}
