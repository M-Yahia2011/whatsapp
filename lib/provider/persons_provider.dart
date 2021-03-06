import 'package:flutter/material.dart';
import 'package:whatsapp/models/person.dart';
import 'package:whatsapp/models/status_item.dart';

class PersonsProvider with ChangeNotifier {
  List<Person> _persons = [
    Person(
        userID: 1,
        userName: "Mohamed Yahia",
        userImage:
            "https://i.pinimg.com/originals/f0/02/23/f00223f7c725c86e45d4255f0ad7705b.jpg",
        userStatus: [
          Status(id: 1, images: [
            "https://i.pinimg.com/originals/f0/02/23/f00223f7c725c86e45d4255f0ad7705b.jpg"
          ]),
          Status(id: 1, images: [
            "https://i.pinimg.com/originals/f0/02/23/f00223f7c725c86e45d4255f0ad7705b.jpg"
          ]),
          Status(id: 1, images: [
            "https://i.pinimg.com/originals/f0/02/23/f00223f7c725c86e45d4255f0ad7705b.jpg"
          ]),
        ],
        muteStatus: true),
    Person(
        userID: 1,
        userName: "Dazai Osumo",
        userImage:
            "https://i.pinimg.com/564x/53/59/d6/5359d6b42b19e91b88ba0d644a7e2c18.jpg",
        userStatus: null),
    Person(
        userID: 1,
        userName: "Naruto-Kun",
        userImage:
            "https://i.pinimg.com/originals/f0/02/23/f00223f7c725c86e45d4255f0ad7705b.jpg",
        userStatus: null,
        muteStatus: true),
    Person(
        userID: 1,
        userName: "Khaled Yahia",
        userImage:
            "https://i.pinimg.com/236x/4c/75/0b/4c750bc5a124bd0d857289c7abcfc513.jpg",
        userStatus: null),
    Person(
        userID: 1,
        userName: "Khaled Yahia",
        userImage:
            "https://i.pinimg.com/236x/4c/75/0b/4c750bc5a124bd0d857289c7abcfc513.jpg",
        userStatus: [
          Status(id: 1, images: [
            "https://i.pinimg.com/236x/4c/75/0b/4c750bc5a124bd0d857289c7abcfc513.jpg"
          ]),
          Status(id: 1, images: [
            "https://i.pinimg.com/236x/4c/75/0b/4c750bc5a124bd0d857289c7abcfc513.jpg"
          ]),
          Status(id: 1, images: [
            "https://i.pinimg.com/236x/4c/75/0b/4c750bc5a124bd0d857289c7abcfc513.jpg"
          ])
        ]),
  ];

  List<Person> get persons {
    return [..._persons];
  }

  List<Person> get recentStatus {
    return persons.where((person) => person.userStatus != null).toList();
  }

  List<Person> get mutedStatus {
    return persons.where((person) => person.muteStatus == true).toList();
  }

  List<Person> get viewedStatus {
    return [];
  }
}
