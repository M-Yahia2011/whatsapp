import 'package:flutter/material.dart';

class OtherMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50,
        ),
        child: Card(
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
                child: Text(
                  "22:22 AM",
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}