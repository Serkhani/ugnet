import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:dotted_border/dotted_border.dart';

class FileUploadContainer extends StatelessWidget {
  const FileUploadContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FilePickerCross.importFromStorage()
            .then((value) => value.path.toString())
            .onError((error, stackTrace) => "NA");
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: DottedBorder(
          color: Colors.blueGrey,
          radius: const Radius.circular(10.0),
          padding: const EdgeInsets.all(8.0),
          borderType: BorderType.RRect,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/cloud.png')),
              Text("Add file", style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}






// Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Center(
//             child: SizedBox(
//                 width: 250.0,
//                 height: 200.0,
//                 child: GestureDetector(
                    // onTap: () async {
                    //   await FilePickerCross.importFromStorage()
                    //       .then((value) => value.path.toString()
                    //    );
                    // },
//                     child: Card(
//                         elevation: 12.0,
//                         shadowColor: Colors.blueGrey,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         // color: processor.theColor.value,
//                         child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: DottedBorder(
//                                 radius: const Radius.circular(30.0),
//                                 strokeCap: StrokeCap.square,
//                                 dashPattern: const [7],
//                                 strokeWidth: 0.5,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     // processor.thePath.value ==
//                                     //         'assets/images/cloud.png'
//                                     //     ? Image.asset(processor.thePath.value,
//                                     //         // fit: BoxFit.contain,
//                                     //         width: 60.0,
//                                     //         height: 70.0)
//                                     //     : Container(
//                                     //         child: Image.file(
//                                     //           File(processor.thePath.value),
//                                     //         ),
//                                     //         width: 60.0,
//                                     //         height: 60.0),
//                                     const Text.rich(
//                                       TextSpan(
//                                           text: "Drag&Drop the image here ",
//                                           style: TextStyle(
//                                               fontSize: 17.0,
//                                               shadows: [
//                                                 Shadow(
//                                                     color: Colors.black12,
//                                                     offset: Offset(-2, -1)),
//                                               ]),
//                                           children: [
//                                             TextSpan(
//                                                 text: "\n\nor\n",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                 )),
//                                           ]),
//                                       overflow: TextOverflow.clip,
//                                       textAlign: TextAlign.center,
//                                       // textWidthBasis: TextWidthBasis.parent,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const Text(
//                                       "Browse",
//                                       style: TextStyle(color: Colors.lightBlue),
//                                     )
//                                   ],
//                                 )
//                                 // ),
//                                 )))))));
