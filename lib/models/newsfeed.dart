import 'package:flutter/material.dart';
import 'package:ugnet/Utils/post.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key, required this.postData}) : super(key: key);
  final PostData postData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.only(bottom: 50.0),
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
          subtitle: Text(
            postData.subtitle.text,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white60),
          )),
    );
  }
}
