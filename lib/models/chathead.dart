import 'package:flutter/material.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({Key? key, this.isUnread = false}) : super(key: key);
  final bool isUnread;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.lightBlueAccent)),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(),
            )),
      Positioned(
            right: 5.0,
            child:isUnread
            ? Container(
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                width: 10.0,
                height: 10.0)
            : Container())
      ],
    );
  }
}
