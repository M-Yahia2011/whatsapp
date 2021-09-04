import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/helpers/colors.dart';

class MessagingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                height: 50,
                decoration: ShapeDecoration(
                    shadows: [BoxShadow(blurRadius: 2, color: Colors.black38)],
                    shape: StadiumBorder(),
                    color: Colors.white),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.insert_emoticon,
                          color: Colors.grey,
                          size: 30,
                        )),
                    Expanded(
                        child: TextField(
                      expands: true,
                      maxLines: null,
                      // minLines: null,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: "Message",
                          border: InputBorder.none,
                         ),
                    )),
                    Transform.rotate(
                      angle: -45 * (3.14 / 180),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.send,
              ),
              style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(50, 50),
                  primary: MyColors.whatsapp[400],
                  shape: CircleBorder()),
            )
          ],
        ),
      ),
    );
  }
}
