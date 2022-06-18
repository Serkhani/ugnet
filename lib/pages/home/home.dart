import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugnet/Utils/post.dart';
import 'package:ugnet/models/calender.dart';
import 'package:ugnet/models/chathead.dart';
import 'package:ugnet/models/live_id.dart';
import 'package:ugnet/models/newsfeed.dart';
import 'package:ugnet/models/upcominglessons.dart';
import 'package:ugnet/pages/home/profile/profile.dart';
import 'package:ugnet/models/task_and_event.dart';
import 'package:ugnet/pages/home/tasks_and_events/todo.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final ScrollController chatScrollController = ScrollController();
  final ScrollController pageScrollController = ScrollController();
  final ScrollController uLessonScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: pageScrollController,
        child: Container(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const LiveID(),
              const Spacer(),
              IconButton(
                  padding: const EdgeInsets.only(right: 20.0),
                  onPressed: () {
                    Get.to(ProfilePage());
                  },
                  icon: Icon(Icons.person_outline_sharp,
                      color: Theme.of(context).primaryColor))
            ]),
            SizedBox(
                height: 80.0,
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  RichText(
                      softWrap: false,
                      text: TextSpan(
                          text: "Hi,",
                          style: Theme.of(context).textTheme.labelLarge,
                          children: [
                            TextSpan(
                                text: "\nBoniface!", //add name
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 30.0))
                          ])),
                  Expanded(
                      child: ListView.separated(
                          controller: chatScrollController,
                          shrinkWrap: true,
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 4.0);
                          },
                          itemBuilder: (context, index) {
                            if (index % 2 == 0) {
                              return const Center(
                                  child: ChatHead(isUnread: true));
                            } else {
                              return const Center(child: ChatHead());
                            }
                          }))
                ])),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                constraints:
                    const BoxConstraints(minHeight: 200.0, maxHeight: 250.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3.0, color: Colors.yellow.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(10.0)),
                child: PhysicalModel(
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).primaryColor,
                  child: NewsFeed(
                      postData: PostData(
                          name: "Dr. Armah",
                          username: "@AB",
                          subtitle: Subtitle(
                              text: "The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. The deadline for submission is midnight, tonight. ",
                              media: []),
                          profilePhoto: "")),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                    onTap: () {
                      Get.to(const ToDo());
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 2.0),
                            child: Text("Tasks and Events",
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          const TandE(
                              title: "X Tasks",
                              subtitle: "\nTry to finish what you've started",
                              icon: Icons.task_outlined),
                          const TandE(
                              title: "Events",
                              subtitle: "\nCreate and share event",
                              icon: Icons.event_available_outlined)
                        ]))),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text("Upcoming Lessons",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Container(
              padding: const EdgeInsets.only(right: 8.0),
              height: 150.0,
              child: ListView.separated(
                  shrinkWrap: true,
                  controller: uLessonScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 5.0);
                  },
                  itemBuilder: (context, index) {
                    return const UpComingLessons();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text("Calender",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const Calender()
          ]),
        ),
      ),
    );
  }
}
