import 'package:flutter/material.dart';

class ThemeInfo {
  final bodyMTextStyle = const TextStyle(
      fontFamily: 'Patrick Hand',
      color: Colors.grey, 
      fontWeight: FontWeight.bold
  );
  final darkBodyMTextSStyle = const TextStyle(
    fontFamily: 'Patrick Hand',
    color: Colors.black87,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );
  final lightBodyMTextSStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Patrick Hand',
    fontStyle: FontStyle.italic,
    overflow: TextOverflow.fade,
    fontWeight: FontWeight.bold,
    fontSize: 24.0
  );
  final lightTheme = Theme(
      data: ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue.withOpacity(0.7),
        backgroundColor: Colors.grey.withOpacity(0.3),
        textTheme: TextTheme(
          labelLarge: const TextStyle(
              color: Colors.black87,
              fontFamily: 'Patrick Hand',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
          titleLarge: const TextStyle(
              color: Colors.black87,
              overflow: TextOverflow.fade,
              fontFamily: 'Patrick Hand',
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
          titleMedium: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontFamily: 'Patrick Hand',
              overflow: TextOverflow.fade,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          titleSmall: const TextStyle(
              color: Colors.black38,
              fontFamily: 'Patrick Hand',
              fontStyle: FontStyle.italic,
              overflow: TextOverflow.fade,
              fontWeight: FontWeight.normal,
              fontSize: 15.0),
        ),
      ),
      child: Container());
  final darkTheme = Theme(
      data: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        primaryColor: Colors.grey,
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          labelLarge: const TextStyle(
              overflow: TextOverflow.fade,
              color: Colors.white,
              fontFamily: 'Patrick Hand',
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
          titleLarge: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontFamily: 'Patrick Hand',
              overflow: TextOverflow.fade,
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
          titleMedium: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontFamily: 'Patrick Hand',
              overflow: TextOverflow.fade,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          titleSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontFamily: 'Patrick Hand',
              overflow: TextOverflow.fade,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
              fontSize: 15.0),
        ),
      ),
      child: Container());
}
