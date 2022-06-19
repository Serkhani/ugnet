import 'package:flutter/material.dart';
import 'package:ugnet/Utils/map.dart';
import 'package:ugnet/Utils/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key?
        key, required this.taskInfo}) : super(key: key);
  final Task taskInfo;
  @override
  Widget build(BuildContext context) {
    // DateTime finalTime = taskInfo.startTime.add(taskInfo.duration);
    DateTime finalTime = taskInfo.deadline;
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            height: 120.0,
            decoration: BoxDecoration(
                color: Colors.grey[750],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(2, 2),
                      spreadRadius: 0.4)
                ]),
            child: PhysicalModel(
                // color: Theme.of(context).primaryColor,
                // color: Colors.white70,
                color: Colors.white24,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.rectangle,
                elevation: 20.0,
                shadowColor: Colors.grey,
                child: Container(
                    // color: Colors.red,
                    // width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "${taskInfo.startTime.hour}:${taskInfo.startTime.minute}",
                                style: Theme.of(context).textTheme.titleSmall),
                            Text("to",
                                style: Theme.of(context).textTheme.titleSmall),
                            Text("${finalTime.hour}:${finalTime.minute}",
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                      const Divider(
                          height: 120.0,
                          // color: Theme.of(context).backgroundColor,
                          color: Colors.white,
                          thickness: 5.0),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Subject,
                            Text(taskInfo.title,
                                style: Theme.of(context).textTheme.titleLarge),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 4.0),
                                  child: CircleAvatar(maxRadius: 12.0),
                                ),
                                //lecture name
                                Text(taskInfo.author,
                                    style:
                                        Theme.of(context).textTheme.titleMedium)
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 4.0),
                                  child: Icon(Icons.location_on_outlined,
                                      color: Colors.grey),
                                ),
                                //lecture name
                                GestureDetector(
                                    onTap: () {
                                      // Route to map
                                      LaunchMap.openMap(5.6553, 0.1830); // for now opens map to the location of the school.
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 50.0,
                                      child: Center(
                                        child: Text(taskInfo.location,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                      ),
                                    ))
                              ],
                            ),
                            // Text(taskInfo.info)
                          ],
                        ),
                      )
                    ])))));
  }
}
