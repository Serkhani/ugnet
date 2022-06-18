import 'package:flutter/material.dart';

class LiveID extends StatelessWidget {
  const LiveID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.redAccent)
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: const [
            Icon(Icons.fiber_smart_record_outlined,
            color: Colors.redAccent,
            size: 15.0,),
            Text(" Live", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent))
          ]
        ),
      ),
    );
  }
}
