import 'package:flutter/material.dart';
import 'package:whatsapp/models/person.dart';

import '../helpers/colors.dart';
import 'package:intl/intl.dart' as intl;

class ChatItem extends StatelessWidget {
  final Person person;
  ChatItem(this.person);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: person.userImage == null
            ? Icon(
                Icons.account_circle,
                size: 60,
                color: MyColors.whatsapp[100],
              )
            : CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  person.userImage!,
                )),
        // Icon(
        //   Icons.account_circle,
        //   size: 60,
        //   color: MyColors.whatsapp[100],
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(person.userName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              intl.DateFormat.jm().format(DateTime.now()),
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.done_all,
              size: 17,
              color: MyColors.whatsapp[600],
            ),
            SizedBox(width: 5),
            Text("last massege"),
          ],
        ),
      ),
    );
  }
}
