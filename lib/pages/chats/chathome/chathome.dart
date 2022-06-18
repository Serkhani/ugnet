import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ugnet/Utils/chat_tile.dart';
import 'package:ugnet/pages/chats/chathome/chatlist.dart';
import 'package:ugnet/pages/chats/chathome/pinnedchathead.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:ugnet/pages/chats/chathome/searchtab.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({Key? key}) : super(key: key);
  randomString() {
    var random = Random.secure();
    var values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
  @override
  Widget build(BuildContext context) {
    ScrollController chatHomeScrollCon = ScrollController();
    List<ChatTile> chats = [
      ChatTile(
          image: "",
          title: "Jamie Lannister",          
          unreadMessage: "10",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "I pledged to fight for the living and I intend on keeping that promise"
            ),
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "By what right does the bull judge the lion\nBy what right??"
            ),
          ],
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Samuel Tully",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Calling you fucked wouldn't be strictly accurate"
            ),
          ],
          unreadMessage: "10",
          time: "19:20"),
      ChatTile(
          image: "",
          title: "Jon Snow",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "The people who follow you know that you made something impossible happen. But if you use them to melt castles and burn cities, you are not different you are just more the same."
            ),
          ],
          unreadMessage: "10",
          time: "13:20"),
      ChatTile(
          image: "",
          title: "Sandor Clegane",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Don't you realize, nowhere is safe and if you haven't realized that yet then maybe you are not the right person to protect her"
            ),
          ],
          unreadMessage: "10",
          time: "14:20"),
      ChatTile(
          image: "",
          title: "Theone Greyjoy",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ], 
          unreadMessage: "10",
          time: "12:20"),
      ChatTile(
          image: "",
          title: "Umber Girl",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "I don't plan to knit by the fireplace as men fight for me"
            ),
          ],
          unreadMessage: "10",
          time: "12:20"),
      ChatTile(
          image: "",
          title: "Sir Davos",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Those hard sons of bitches chose him as a leader because they believe in him and those things you don't believe in, he faced those things, he fought those things for the blood of his people, he risked his life for his people, he took a knife in the heart for his people"
            ),
          ],
          unreadMessage: "10",
          time: "12:20"),
      ChatTile(
          image: "",
          title: "Ned Stark",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "You think my life is the most precious thing to me, as I would trade my honour for a few more years of what?"
            ),
          ],
          unreadMessage: "10",
          time: "12:20"),
      ChatTile(
          image: "",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Blood of my blood"
            ),
          ],
          title: "Jorah Mormont",
          unreadMessage: "10",
          time: "12:20"),
      ChatTile(
          image: "",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          title: "Rob Stark",
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Ramsey Snow",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Obren Martell",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Varis",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Fire and blood"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Darion",
          
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "The second sons are yours and so is Darion Naharis"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Son",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Son",
          unreadMessage: "10",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Son",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
      ChatTile(
          image: "",
          title: "Son",
          messages: [
            types.TextMessage(
              author: const types.User(id: "Jamie"),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Information dey this world inside"
            ),
          ],
          unreadMessage: "10",
          time: "18:20"),
    ];

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          controller: chatHomeScrollCon,
          children: [SearchTab(chats: chats), const PinnedChatHeads(), ListChat(chats: chats)],
        ));
  }
}
