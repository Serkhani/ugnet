import 'package:flutter/material.dart';
import 'package:ugnet/models/inputfield.dart';
import 'package:ugnet/pages/suggestion/upload_file.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: const Duration(milliseconds: 500),
      // insetAnimationCurve: Curves.bounceOut,
      // backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.transparent,
      // insetPadding: EdgeInsets.all(8.0),
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 8.0,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Create Post",
                  style: Theme.of(context).textTheme.titleLarge),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check)),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded)),
                ],
              )
            ],
          ),
          InputField(
              maxLines: 7,
              label: Text("Post",
                  style: Theme.of(context).textTheme.titleMedium)),
          const FileUploadContainer()
          // Expanded(
          //     child: InputField(
          //         maxLines: 3,
          //         label: Text("Description",
          //             style: Theme.of(context).textTheme.titleMedium))),
        ]),
      ),
    );

  }
}