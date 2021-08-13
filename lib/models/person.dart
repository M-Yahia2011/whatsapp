import '../models/status_item.dart';

class Person {
  late int userID;
  late String userName;
  late String? userImage;
  Status? userStatus;
  bool muteStatus = false;
  Person({
    required this.userID,
    required this.userName,
    this.userImage,
    this.userStatus,
  });

  void mutePersonStatus() {
    muteStatus = true;
  }
}
