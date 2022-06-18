import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugnet/Utils/course.dart';
import 'package:ugnet/Utils/finance.dart';
import 'package:ugnet/Utils/grade.dart';
import 'package:ugnet/Utils/group.dart';
import 'package:ugnet/Utils/user.dart';
import 'package:ugnet/pages/home/profile/webview/website_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    User user = User(
        name: "name",
        level: "level",
        username: "@username",
        image: "image",
        groups: <Group>[
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
          Group(
              name: "BoysBoys",
              info: "A group for the boys",
              image: "imagePath"),
        ],
        courses: <Course>[],
        finances: <Finance>[],
        residence: "Commonwealth",
        grades: <Grade>[]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.3),
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.7),
        body: Container(
          color: Theme.of(context).backgroundColor,
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Column(children: [
                Row(children: [
                  const CircleAvatar(minRadius: 50.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(user.username,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontStyle: FontStyle.normal)),
                        Text(user.level,
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                  ),
                ]),
              ]),
            ),
            Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.only(top: 8.0),
                child: ExpansionTile(
                    title: Text("Sites",
                        style: Theme.of(context).textTheme.titleLarge),
                    children: [
                      ListTile(
                        onTap: () {
                          Get.off(WebSiteView(pageUrl: "https://sakai.ug.edu.gh/portal/", controller: controller));
                        },
                        leading: const CircleAvatar(),
                        title: Text("Sakai",
                            style: Theme.of(context).textTheme.titleLarge),
                        // subtitle: Text("Sites", style: Theme.of(context).textTheme.titleLarge),
                      ),
                      ListTile(
                        leading: const CircleAvatar(),                        
                        onTap: () {
                          Get.off(WebSiteView(pageUrl: "https://sts.ug.edu.gh/services/", controller: controller));
                        },
                        title: Text("sts",
                            style: Theme.of(context).textTheme.titleLarge),
                        // subtitle: Text("Sites", style: Theme.of(context).textTheme.titleLarge),
                      ),
                      ListTile(
                        onTap: () {
                          Get.off(WebSiteView(pageUrl: "https://ienabler.ug.edu.gh/pls/prodi41/w99pkg.mi_login", controller: controller));
                        },
                        leading: const CircleAvatar(),
                        title: Text("MIS web",
                            style: Theme.of(context).textTheme.titleLarge),
                        // subtitle: Text("Sites", style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ]))
          ]),
        ));
  }
}
