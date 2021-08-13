import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class CallItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.account_circle,
        size: 60,
        color: MyColors.whatsapp[100],
      ),
      title: Text("Name"),
      subtitle: Row(
        children: [
          Icon(
            Icons.south_west,
            color: Colors.redAccent,
            size: 15,
          ),
          Text("00/00/00"),
        ],
      ),
    );
  }
}
