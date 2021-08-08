import 'package:flutter/material.dart';
import 'package:whatsapp/helpers/colors.dart';
import 'package:intl/intl.dart' as intl;

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      itemCount: 20,
      itemBuilder: (ctx, idx) => InkWell(
        onTap: () {},
        child: ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 60,
            color: MyColors.whatsapp[100],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
