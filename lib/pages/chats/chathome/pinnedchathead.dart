import 'package:flutter/material.dart';
import 'package:ugnet/models/chathead.dart';

class PinnedChatHeads extends StatelessWidget {
  const PinnedChatHeads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController pinnedChatScrollCon = ScrollController();
    List<String> houses = [
      "Greyjoy",
      "Martell",
      "Targaryen",
      "Lannister",
      "Baratheon",
      "Tully",
      "Stark"
    ];
    return SizedBox(
        // color: Theme.of(context).backgroundColor,
        height: 85.0,
        child: Row(
          children: [
            Text("Groups: ", style: Theme.of(context).textTheme.titleLarge),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  controller: pinnedChatScrollCon,
                  scrollDirection: Axis.horizontal,
                  itemCount: houses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 4.0),
                      child: Column(
                        children: [
                          const ChatHead(),
                          Expanded(
                            child: Text(houses[index],
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontStyle: FontStyle.normal)),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
