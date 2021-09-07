import 'package:flutter/material.dart';
import '../models/person.dart';
import '../widgets/messaging_bar.dart';
import '../widgets/my_message_card.dart';
import '../widgets/other_message_card.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '\chat-screen';

  @override
  Widget build(BuildContext context) {
    final personMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, Person>;
    final person = personMap['person'];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 85,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                // onTap: () => Navigator.of(context).pop(),
                child: Icon(
              Icons.arrow_back,
              size: 24,
            )),
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                person!.userImage!,
              ),
            )
          ],
        ),
        titleSpacing: 0,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.userName),
              Text(
                "Last Seen Yesterday",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height - 150,
              child: ListView(
                shrinkWrap: true,
                children: [
                  MyMessageCard(),
                  OtherMessageCard(),
                  MyMessageCard(),
                  OtherMessageCard(),
                  MyMessageCard(),
                  OtherMessageCard(),
                  MyMessageCard(),
                  OtherMessageCard(),
                ],
              ),
            ),
            MessagingBar(),
          ]),
        ),
      ),
    );
  }
}
