import 'package:flutter/material.dart';
import 'package:ugnet/models/inputfield.dart';
import 'package:ugnet/models/time_selector.dart';

class CreateTaskDialogBox extends StatelessWidget {
  const CreateTaskDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Dialog(
      insetAnimationDuration: const Duration(milliseconds: 500),
      // insetAnimationCurve: Curves.bounceOut,
      // backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.transparent,
      // insetPadding: EdgeInsets.all(8.0),
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 8.0,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Create Task",
                  style: Theme.of(context).textTheme.titleLarge),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded)),
                ],
              )
            ],
          ),
          InputField(
              maxLines: 1,
              label: Text("Task title",
                  style: Theme.of(context).textTheme.titleMedium)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeSelector(dateTime: now, startEnd: 'Start'),
              TimeSelector(dateTime: now, startEnd: 'Ends'),
            ],
          ),
          InputField(
              maxLines: 1,
              label: Text("Location",
                  style: Theme.of(context).textTheme.titleMedium)),
          Expanded(
              child: InputField(
                  maxLines: 3,
                  label: Text("Description",
                      style: Theme.of(context).textTheme.titleMedium))),
        ]),
      ),
    );
  }
}
