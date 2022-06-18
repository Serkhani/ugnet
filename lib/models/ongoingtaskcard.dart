import 'package:flutter/material.dart';
import 'package:ugnet/Utils/task.dart';
import 'package:ugnet/models/timeleft.dart';

class OngoingTaskCard extends StatelessWidget {
  const OngoingTaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task task = Task(
        deadline: DateTime(2022, 6, 14, 3, 0),
        title: 'WorkWorkWorkWorkWorkWorkWorkWorkWorkWorkWorkWorkWorkWorkWork',
        info:
            "This is some shit you write when you are not sure about what to do and still need some more clarity and I am still talking because I want to see how the text overflow will look like :)", 
        startTime: DateTime(2022, 6, 14, 3, 0));

    return Container(
        height: 120.0,
        decoration: BoxDecoration(
            color: Colors.grey[350],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(2, 2),
                  spreadRadius: 0.4)
            ]),
        child: PhysicalModel(
          color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            elevation: 20.0,
            shadowColor: Colors.grey,
            child: Container(
              height: 150.0,
              width: 100.0,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TimeLeft(task: task),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                          text: task.title,
                          style: Theme.of(context).textTheme.titleMedium),
                          overflow: TextOverflow.fade,
                          softWrap: true),
                  ),
                ],
              ),
            )
       )
    );
  }
}