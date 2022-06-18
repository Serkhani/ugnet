import 'package:flutter/material.dart';
import 'package:ugnet/Utils/post.dart';
import 'package:ugnet/models/post.dart';
import 'package:ugnet/pages/notifications/add_post.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PostData> posts = [
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: ["r"]),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
      PostData(
          name: "Dr. Armah",
          username: "@AB",
          subtitle: Subtitle(
              text: "All your work must be submitted before midnight",
              media: []),
          profilePhoto: ""),
    ];
    ScrollController notiScrollCon = ScrollController();
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          //display if only admin account
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AddPostView();
                });
          },

          tooltip: "Add post",
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add_circle_outline_sharp),
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            // width: /
            child: ListView.builder(
                controller: notiScrollCon,
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Post(postData: posts[index]);
                })));
  }
}
