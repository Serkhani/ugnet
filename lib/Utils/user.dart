import 'package:ugnet/Utils/course.dart';
import 'package:ugnet/Utils/finance.dart';
import 'package:ugnet/Utils/grade.dart';
import 'package:ugnet/Utils/group.dart';

class User {
  final String name;
  final String level;
  final String username;
  final String image;
  final List<Group> groups;
  final List<Course> courses;
  final List<Finance> finances; //hall fee, school fees, membership dues...
  final String residence;
  final List<Grade> grades;
  User(
      {required this.name,
      required this.level,
      required this.username,
      required this.image,
      required this.groups,
      required this.courses,
      required this.finances,
      required this.residence,
      required this.grades});
}
