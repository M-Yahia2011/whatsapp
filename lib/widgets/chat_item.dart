import 'package:flutter/material.dart';
import 'package:whatsapp/models/person.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import '../helpers/colors.dart';
import 'package:intl/intl.dart' as intl;

class ChatItem extends StatelessWidget {
  final Person person;
  ChatItem(this.person);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ChatScreen.routeName, arguments: {"person":person});
      },
      child: ListTile(
        leading: person.userImage == null
            ? Icon(
                Icons.account_circle,
                size: 60,
                color: MyColors.whatsapp[100],
              )
            : InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return ContactImageDialog(person: person);
                      });
                },
                child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      person.userImage!,
                    )),
              ),
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

class ContactImageDialog extends StatelessWidget {
  const ContactImageDialog({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(0),
      shape: BeveledRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.zero),
      children: [
        Container(
          height: 300,
          child: Stack(fit: StackFit.expand, children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.network(
                person.userImage!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              height: 30,
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                width: double.infinity,
                color: Colors.black38,
                child: Text(
                  person.userName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat_rounded, color: MyColors.whatsapp[400])),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.call, color: MyColors.whatsapp[400])),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.videocam, color: MyColors.whatsapp[400])),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.info_outline, color: MyColors.whatsapp[400]))
          ],
        )
      ],
    );
  }
}
