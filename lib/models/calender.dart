import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8.0),
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            // color: Colors.lightBlue.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.0),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2.0)),
        child: CalendarDatePicker(
            initialDate: DateTime.now(),
            currentDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2999, 12, 31),
            onDateChanged: (dateTime) {}));
  }
}
