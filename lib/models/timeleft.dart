import 'package:flutter/material.dart';
import 'package:ugnet/Utils/task.dart';

class TimeLeft extends StatelessWidget {
  const TimeLeft({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(Icons.arrow_drop_down_circle_sharp,
              size: 10.0, color: Colors.red.shade700),
        ),
        Text.rich(
            task.getDays() != null
                ? TextSpan(
                    text:
                        "${task.getDays()}day${task.getDays() == 1 ? "" : "s"} left")
                : task.getHours() != null
                    ? TextSpan(
                        text:
                            "${task.getHours()}hr${task.getHours() == 1 ? "" : "s"} left")
                    : task.getMinutes() != null
                        ? TextSpan(
                            text:
                                "${task.getMinutes()}min${task.getMinutes() == 1 ? "" : "s"} left")
                        : const TextSpan(text: ""),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 12.0, fontStyle: FontStyle.normal))
      ],
    );
  }
}
