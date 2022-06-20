import 'package:flutter/material.dart';
import 'package:ugnet/Utils/course.dart';
import 'package:ugnet/Utils/task.dart';
import 'package:ugnet/models/taskcard.dart';
import 'package:ugnet/pages/home/tasks_and_events/ongoing_task.dart';
import 'package:ugnet/pages/home/tasks_and_events/task_creation_dialog.dart';

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Course course = Course(
        duration: const Duration(hours: 2),
        beginTime: DateTime(2022, 7, 7, 7, 30),
        name: "Mechanics",
        lecturer: "Dr. Armah",
        venue:
            'NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1NNB 1');
    Task task = Task(
        deadline: DateTime(2023, 6, 14, 17, 30),
        title: "Eat, Sleep, Conquer, Repeat",
        startTime: DateTime.now(),
        location: "NNB 1",
        info:
            "Wrestling is a fake sport but loved by many... interesting thing to know... this is prove that the human race actually adores a good lie");
    List events = [course, task];
    ScrollController todoScrollCon = ScrollController();
    // var tasks = [1, 2, 3];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text("ToDo", style: Theme.of(context).textTheme.titleLarge)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.9),
        onPressed: () {
          showDialog(
            useSafeArea: false,
              context: context,
              builder: (context) {
                return const CreateTaskDialogBox();
              });
        },
        tooltip: "Add task",
        child: const Icon(Icons.add_circle_outline_sharp,
            // color: Theme.of(context).backgroundColor.withOpacity(0.9),
            color: Colors.white70),
      ),
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.9),
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        // color: Colors.yellow,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: OngoingTask(),
            ),
            Expanded(
              child: ListView.builder(
                controller: todoScrollCon,
                // itemCount: tasks.length,
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(taskInfo: events[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
