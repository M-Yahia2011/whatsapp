import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/call_item.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          padding: EdgeInsets.symmetric(vertical: 0),
          children: List.generate(10, (index) => CallItem())),
    );
  }
}
