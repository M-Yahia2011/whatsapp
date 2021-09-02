import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/models/person.dart';

import '../helpers/colors.dart';

class StatusItem extends StatelessWidget {
  final Person person;
  StatusItem(this.person);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        size: Size.infinite,
        painter:
            StatusCirclePainter(statusListLength: person.userStatus!.length),
        child: person.userImage == null
            ? Icon(
                Icons.account_circle,
                size: 60,
                color: MyColors.whatsapp[100],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  width: 58,
                  height: 60,
                  child: Image.network(
                    person.userImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
      title: Text(
        person.userName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("06:30 PM"),
    );
  }
}

class StatusCirclePainter extends CustomPainter {
  int statusListLength;
  StatusCirclePainter({required this.statusListLength});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.isAntiAlias = true;
    paint.strokeWidth = 6.0;
    paint.color = Color(0xfff00B39B);
    paint.style = PaintingStyle.stroke;
    drawCircle(canvas, size, paint);
  }

  double degToRad(double degree) {
    return degree * pi / 180;
  }

  void drawCircle(Canvas canvas, Size size, Paint paint) {
    if (statusListLength == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degToRad(0), degToRad(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusListLength;
      for (int i = 0; i < statusListLength; i++) {
        canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height),
            degToRad(degree + 4), degToRad(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
