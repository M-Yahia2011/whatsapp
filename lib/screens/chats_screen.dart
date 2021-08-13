import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/models/person.dart';
import 'package:whatsapp/provider/persons_provider.dart';
import 'package:whatsapp/widgets/chat_item.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<PersonsProvider>(
      builder: (ctx, provider, _) {
        List<Person> list = provider.persons;
        return 
        ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          itemCount: list.length,
          itemBuilder: (ctx, idx) => ChatItem(list[idx]),
        );
      },
    );
  }
}
