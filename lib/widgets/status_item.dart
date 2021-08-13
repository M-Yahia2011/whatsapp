import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class StatusItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 60,
        color: MyColors.whatsapp[100],
      ),
      title: Text("Name"),
      subtitle: Text("date 00/00/00"),
    );
  }
}