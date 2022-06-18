import 'dart:io';

class Map {
  Map._();
  static Future<void> openMap(double lat, double lng) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    // String googleUrl = 'comgooglemaps://?center=$lat,$lng'; one must go!
    String appleUrl = 'https://maps.apple.com/?q=$lat,$lng';
    if (Platform.isIOS) {
      if (await canLaunch(appleUrl)) {
        await launch(googleUrl);
      } else {
        // Can not launch with apple maps
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          // Can not google maps
        }
      }
    } else {
      // Platform is android
      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else {
        // Can not google maps
      }
    }
  }
}
