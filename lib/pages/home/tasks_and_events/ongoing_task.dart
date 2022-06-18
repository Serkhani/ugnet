import 'package:flutter/material.dart';
import 'package:ugnet/models/ongoingtaskcard.dart';

class OngoingTask extends StatelessWidget {
  const OngoingTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController onGoingScrollCon = ScrollController();
    return PhysicalModel(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 8.0,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white24,
                gradient: const LinearGradient(
                    // radius: MediaQuery.of(context).size.width /2,
                    colors: [
                      Colors.amber,
                      Colors.amberAccent,
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.blueGrey,
                      Colors.cyan,
                      Colors.red,
                      Colors.redAccent
                    ])),
            height: 130.0,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 24.0,
                    child: Text("  Ongoing task(s):",
                        style: Theme.of(context).textTheme.titleMedium)),
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.separated(
                      controller: onGoingScrollCon,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      separatorBuilder: (context, index) {
                        // return EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                        return const SizedBox(width: 5.0);
                      },
                      itemBuilder: (context, index) {
                        return const OngoingTaskCard();
                      }),
                ),
              ],
            )));
  }
}
