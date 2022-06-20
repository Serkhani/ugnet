import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugnet/Utils/chat_tile.dart';
import 'package:ugnet/models/chathead.dart';
import 'package:ugnet/pages/chats/chatscreen.dart';

class SearchTab extends StatefulWidget {
  final List<ChatTile> chats;
  const SearchTab({Key? key, required this.chats}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: Search(chats: widget.chats),
          );
        },
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            height: 30.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).backgroundColor,
                border: Border.all(color: Colors.grey)),
            child: Center(
                child: Text("Search",
                    style: Theme.of(context).textTheme.titleSmall))));
  }
}

class Search extends SearchDelegate {
  final List<ChatTile> chats;
  Search({required this.chats});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(height: 100, width: 100.0, color: Colors.blue);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return chats[index].title.toLowerCase().contains(query.toLowerCase())
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    onTap: () {
                      close(context, null);
                      Get.to(ChatScreen(chat: chats[index]),
                          curve: Curves.decelerate);
                    },
                    leading: const ChatHead(),
                    title: Text(chats[index].title,
                        style: Theme.of(context).textTheme.titleMedium)))
            : Container();
      },
    );
  }
}
