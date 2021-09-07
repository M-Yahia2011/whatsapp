import '../models/status_item.dart';

class Person {
  late int userID;
  late String userName;
  late String? userImage;
  List<Status>? userStatus;
  bool muteStatus;
  Person({
    required this.userID,
    required this.userName,
    this.userImage,
    this.userStatus,
    this.muteStatus=false
  });

  void mutePerson() {
    muteStatus = true;
  }
}
