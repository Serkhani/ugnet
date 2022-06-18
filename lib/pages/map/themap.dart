import 'package:flutter/material.dart';

class TheMap extends StatelessWidget {
  const TheMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController mapScrollCon = ScrollController();
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: mapScrollCon,
            // scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return const CircleAvatar();
              }),
        ),
      ],
    ));
  }
}
// 5.6553° N, 0.1830° W