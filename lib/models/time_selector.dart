import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  TimeSelector({Key? key, required this.startEnd, required this.dateTime}) : super(key: key);
  DateTime dateTime;
  final String startEnd;

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    final List<String> monthsOfYear = [
      "Jan",
      "Feb",
      "March",
      "April",
      "May",
      "June",
      "July",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];
    TimeOfDay? timeSelected;
    return GestureDetector(
      onTap: () async {
        timeSelected = await showDialog(
            context: context,
            builder: (context) {
              return TimePickerDialog(initialTime: TimeOfDay.now());
            });
        if (timeSelected != null) {
          setState(() {
          widget.dateTime = DateTime(widget.dateTime.year, widget.dateTime.month, widget.dateTime.day, timeSelected!.hour, timeSelected!.minute);  
          });
          
        }
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.startEnd, style: Theme.of(context).textTheme.titleMedium),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).backgroundColor),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                  "${widget.dateTime.day} ${monthsOfYear[widget.dateTime.month - 1]}, ${widget.dateTime.hour}:${widget.dateTime.minute}",
                  style: Theme.of(context).textTheme.titleSmall),
            )
          ])),
    );
  }
}
