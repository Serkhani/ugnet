import 'package:flutter/material.dart';
import 'package:ugnet/Utils/post.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required this.postData}) : super(key: key);
  final PostData postData;
  
  @override
  Widget build(BuildContext context) {
    ScrollController mediaScrollCon = ScrollController();
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(children: [
              Text(postData.name),
              Text(postData.username,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.color!
                          .withOpacity(0.4)))
            ]),
          ),
          subtitle: Column(children: [
            Text(
              postData.subtitle.text,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ListView(
              shrinkWrap: true,
              controller: mediaScrollCon,
              children: [
                Row(
                    children: postData.subtitle.media.map((String? mediaPath) {
                  // return Image.asset(mediaPath);
                  return Container(
                      color: Colors.red, height: 30.0, width: 30.0);
                }).toList()),
              ],
            )
          ]),
        ),
        Divider(
          thickness: 1.0,
          height: 0.0,
          color: Theme.of(context).primaryColor,
          // indent: 60.0
        )
      ],
    );
  }
}
