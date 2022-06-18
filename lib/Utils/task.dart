class Task {
  final DateTime deadline;
  final String title;
  final String info;
  final DateTime startTime;
  String location;
  String author;
  Duration? difference;
  Task(
      {required this.deadline,
      required this.title,
      required this.info,
      this.author = "NA",
      this.difference,
      this.location = "NA",
      required this.startTime}) {
    difference = deadline.difference(DateTime.now());
  }
  int? getDays() {
    if (difference!.inDays <= 0) {
      return null;
    }
    return difference!.inDays;
  }

  int? getHours() {
    if (difference!.inHours <= 0) {
      return null;
    }
    return difference!.inHours % 24;
  }

  int? getMinutes() {
    if (difference!.inMinutes <= 0) {
      return null;
    }
    return difference!.inMinutes % 60;
  }
}
