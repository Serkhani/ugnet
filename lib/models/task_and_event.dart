import 'package:flutter/material.dart';

class TandE extends StatelessWidget {
  const TandE({Key? key, required this.title, required this.subtitle, required this.icon}) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 4.0, top: 8.0),
            child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.task_outlined,
                  color: Theme.of(context).textTheme.titleSmall!.color))), // some random image
        RichText(
            softWrap: false,
            text: TextSpan(
                text: title,
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      text: subtitle,// Maybe use some quotes
                      style: Theme.of(context).textTheme.titleSmall)
            ]
          )
        )
      ]
    );
  }
}
