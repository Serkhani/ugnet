import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, required this.color, super.key});

  final Completer<WebViewController> controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller.future,
      builder: (context, snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return Row(
            children: [
              Icon(Icons.arrow_back_ios, color: color),
              Icon(Icons.arrow_forward_ios, color: color),
              Icon(Icons.replay, color: color),
            ],
          );
        }

        return Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: color),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No back history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: color),
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No forward history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.replay, color: color),
              onPressed: () {
                controller.reload();
              },
            ),
          ],
        );
      },
    );
  }
}
