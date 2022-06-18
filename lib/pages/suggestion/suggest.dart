import 'package:flutter/material.dart';
import 'package:ugnet/pages/suggestion/upload_file.dart';

class Suggest extends StatelessWidget {
  const Suggest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Help Us Improve: ",
                  style: Theme.of(context).textTheme.titleLarge)),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 12,
              onEditingComplete: () {},
              autofocus: true,
              style: Theme.of(context).textTheme.titleSmall,
              decoration: InputDecoration(
                hintText: "i.e. You can change the color theme...",
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(width: 2.0),
                ),
              ),
            ),
          ),
          const FileUploadContainer()
        ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //check if data is available before submitting
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child:
                Text("Submit", style: Theme.of(context).textTheme.titleSmall)));
  }
}
