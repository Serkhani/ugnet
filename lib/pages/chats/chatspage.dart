import 'package:flutter/material.dart';
import 'package:ugnet/models/chathead.dart';
import 'package:ugnet/pages/chats/chathome/chathome.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: ChatHead()),
              ),
              Text("Chats", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30.0))
            ],
          ),
          const Expanded(child: ChatHome()),
        ],
      ),
    );
  }
}
