import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugnet/Utils/chat_tile.dart';
import 'package:ugnet/models/chathead.dart';
import 'package:ugnet/pages/chats/chatscreen.dart';

class ListChat extends StatelessWidget {
  final List<ChatTile> chats;
  const ListChat({Key? key, required this.chats}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
        children: chats.map((chat) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              // route to chat with data
              Get.to(ChatScreen(chat: chat), curve: Curves.decelerate);
            },
            dense: true,
            leading: const ChatHead(),
            contentPadding: const EdgeInsets.all(0),
            style: ListTileStyle.list,
            title: Text(chat.title,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text(chat.messages[0].text.split("\n").first,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontStyle: FontStyle.normal, fontSize: 12.0)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(chat.time,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontStyle: FontStyle.normal, fontSize: 12.0)),
                Container(
                    height: 12.0,
                    width: 12.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Center(
                      child: Text(chat.unreadMessage,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Colors.white70,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 7.0)),
                    )),
              ],
            ),
          ),
          Divider(
              thickness: 1.0,
              height: 0.0,
              color: Theme.of(context).primaryColor,
              indent: 60.0)
        ],
      );
    }).toList());
  }
}
