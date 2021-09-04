import 'package:flutter/material.dart';
import 'package:whatsapp/helpers/colors.dart';
class MyMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50,
        ),
        child: Card(
          color: MyColors.whatsapp[200],
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 80, 20),
                child: Text(
                  'hello',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      "22:22 AM",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}