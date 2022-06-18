import 'package:ugnet/Utils/task.dart';

class Course extends Task {
  final String name;
  final String lecturer;
  final DateTime beginTime;
  final Duration duration;
  final String venue;

  Course(
      {required this.duration,
      required this.name,
      required this.lecturer,
      required this.venue,
      required this.beginTime})
      : super(location: venue, startTime: beginTime, deadline: beginTime.add(duration), author: lecturer, info: "", title: name);
}
