import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ugnet/pages/home/profile/webview/navigation_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSiteView extends StatefulWidget {
  const WebSiteView({Key? key, required this.controller, required this.pageUrl}) : super(key: key);
  final String pageUrl;
  final Completer<WebViewController> controller;

  @override
  State<WebSiteView> createState() => _WebSiteViewState();
}

class _WebSiteViewState extends State<WebSiteView> {
  var loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [NavigationControls(color: Colors.grey, controller: widget.controller)],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.pageUrl,
            onWebViewCreated: (webViewController) {
              widget.controller.complete(webViewController);
            },
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              minHeight: 20.0,
              color: Colors.red
            ),
        ],
      ),
    );
  }
}