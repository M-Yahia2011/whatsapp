import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);
  static const routeName = '/contacts';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Contacts Screen"),
    );
  }
}
