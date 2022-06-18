import 'package:flutter/material.dart';
import 'package:ugnet/Utils/course.dart';

class UpComingLessons extends StatelessWidget {
  const UpComingLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Course course = Course(
        duration: const Duration(hours: 2),
        beginTime: DateTime(2022, 7, 7, 7, 30),
        name: "Mechanics",
        lecturer: "Dr. Armah",
        venue:
            'NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1');
            DateTime endTime = course.beginTime.add(course.duration);
    return Container(
        width: 90.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey, 
                offset: Offset(3, 4), 
                spreadRadius: 0.5
            )
          ]
        ),
        child: PhysicalModel(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10.0),
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: SizedBox(
              height: 60.0, 
              width: 70.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(course.name, style: Theme.of(context).textTheme.titleMedium, softWrap: false),
                  Text(course.lecturer, style: Theme.of(context).textTheme.titleMedium, softWrap: false),
                  Text("${course.beginTime.hour}:${course.beginTime.minute} - ${endTime.hour}:${endTime.minute}", softWrap: false, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontStyle: FontStyle.normal, color: Colors.white60)),
                  
                ]
              )
        )
      )
    );
  }
}
