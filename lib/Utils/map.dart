import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class LaunchMap {
  LaunchMap._();
  static Future<void> openMap(double lat, double lng) async {
    Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    // String googleUrl = 'comgooglemaps://?center=$lat,$lng'; one must go!
    Uri appleUrl = Uri.parse('https://maps.apple.com/?q=$lat,$lng');
    if (Platform.isIOS) {
      if (await canLaunchUrl(appleUrl)) {
        await launchUrl(googleUrl);
      } else {
        // Can not launch with apple maps
        if (await canLaunchUrl(googleUrl)) {
          await launchUrl(googleUrl);
        } else {
          // Can not google maps
        }
      }
    } else {
      // Platform is android
      if (await canLaunchUrl(googleUrl)) {
        await launchUrl(googleUrl);
      } else {
        // Can not google maps
      }
    }
  }
}
