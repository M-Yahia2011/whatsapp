import 'package:flutter/material.dart';

class Tabs {
  static List<Widget> build(BuildContext context) {
    double appbarWidth = MediaQuery.of(context).size.width;
    double tabWidth = appbarWidth / 5;
    return [
      Container(
        width: 30,
        height: 46,
        alignment: Alignment.center,
        child: Icon(
          Icons.camera_alt,
        ),
      ),
      Container(
        width: tabWidth,
        height: 46,
        alignment: Alignment.center,
        child: Text(
          "CHATS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
          width: tabWidth,
          height: 46,
          alignment: Alignment.center,
          child: Text(
            "STATUS",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      Container(
          width: tabWidth,
          height: 46,
          alignment: Alignment.center,
          child: Text(
            "CALL",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))
    ];
  }
}
