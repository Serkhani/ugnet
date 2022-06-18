import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
class ChatTile{
  final String image;
  final String title;
  final String unreadMessage;
  final String time;
  final List<types.TextMessage> messages;
  const ChatTile(
      {required this.image,
      required this.title,
      required this.messages,
      required this.unreadMessage,
      required this.time,
      });
}

// types.TextMessage(
//       author: const types.User(id: "some random string for now"),
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: randomString(),
//       text: widget.chat.subtitle
//     )