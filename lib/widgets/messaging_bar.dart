import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/helpers/colors.dart';

class MessagingBar extends StatefulWidget {
  @override
  _MessagingBarState createState() => _MessagingBarState();
}

class _MessagingBarState extends State<MessagingBar> {
  late final TextEditingController _textController;
  final _textFieldFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 60,
                maxHeight: 200,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  maxLines: 50,
                  minLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  cursorHeight: 26,
                  controller: _textController,
                  focusNode: _textFieldFocusNode,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.insert_emoticon,
                          color: Colors.grey,
                          size: 24,
                        )),
                    hintText: "Message",
                    suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: -45 * (3.14 / 180),
                            child: IconButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (ctx) {
                                        // _textFieldFocusNode.unfocus();

                                        // Disable text field's focus node request
                                        // _textFieldFocusNode.canRequestFocus =
                                        //     false;
                                        return AttachmentsSheet();
                                      });
                                },
                                icon: Icon(
                                  Icons.attach_file,
                                  color: Colors.grey,
                                  size: 24,
                                )),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ),
                        ]),
                    border: InputBorder.none,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}

class AttachmentsSheet extends StatelessWidget {
  const AttachmentsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Table(
          defaultColumnWidth: IntrinsicColumnWidth(),
          children: [
            TableRow(
              children: [
                AttachmetsItem(
                    icon: Icons.insert_drive_file,
                    iconTopColor: Color(0xff5157af),
                    iconBottomColor: Color(0xff5f66cc),
                    label: "Document"),
                AttachmetsItem(
                    icon: Icons.camera_alt,
                    iconTopColor: Color(0xffd4396d),
                    iconBottomColor: Color(0xffEB407A),
                    label: "Camera"),
                AttachmetsItem(
                    icon: Icons.photo,
                    iconTopColor: Color(0xffad45cf),
                    iconBottomColor: Color(0xffbe58cf),
                    label: "Gallery"),
              ],
            ),
            TableRow(
              children: [
                AttachmetsItem(
                    icon: Icons.headset,
                    iconTopColor: Color(0xfff17a02),
                    iconBottomColor: Color(0xfff78e0d),
                    label: "Audio"),
                AttachmetsItem(
                    icon: Icons.videocam_rounded,
                    iconTopColor: Color(0xff396cd4),
                    iconBottomColor: Color(0xff4079eb),
                    label: "Room"),
                AttachmetsItem(
                    icon: Icons.location_pin,
                    iconTopColor: Color(0xff108c50),
                    iconBottomColor: Color(0xff039c52),
                    label: "Location"),
              ],
            ),
            TableRow(
              children: [
                AttachmetsItem(
                    icon: Icons.person,
                    iconTopColor: Color(0xff0796dd),
                    iconBottomColor: Color(0xff0eabf4),
                    label: "Contact"),
                SizedBox(),
                SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AttachmetsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconTopColor;
  final Color iconBottomColor;
  AttachmetsItem(
      {required this.icon,
      required this.iconTopColor,
      required this.iconBottomColor,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      height: 25,
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: iconTopColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: iconBottomColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ]),
            SizedBox(height: 5),
            Text(label)
          ],
        ));
  }
}
