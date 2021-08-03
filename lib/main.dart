import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      theme: ThemeData(
          primarySwatch: MyColors.whatsapp,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: MyColors.whatsapp[300])),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 1;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width / 5;
    return Scaffold(
      appBar: AppBar(
          title: Text("Whatsapp"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Container(
                width: 30,
                height: 50,
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                ),
              ),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("CHATS")),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("STATUS")),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("CALL"))
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("camera"),
          ListView.builder(
              itemCount: 20,
              itemBuilder: (ctx, idx) => InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 60,
                        color: MyColors.whatsapp[100],
                      ),
                      title: Text("Name"),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.done_all,
                            size: 17,
                            color: MyColors.whatsapp[600],
                          ),
                          SizedBox(width: 5),
                          Text("last massege"),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("03/08/21"),
                        ],
                      ),
                    ),
                  )),
          Text("hi"),
          Text("hello 2")
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.chat)),
    );
  }
}

class MyColors {
  static const MaterialColor whatsapp = MaterialColor(
    0xFF075e54,
    <int, Color>{
      50: Color(0xFF162A49),
      100: Color(0xFFDEE5E9),
      200: Color(0xFFdcf8c6),
      300: Color(0xFF25d366), // button
      400: Color(0xFF128c7e),
      500: Color(0xFF075e54), // appbar
      600: Color(0xFF34b7f1), // read tik icon
      700: Color(0xFFece5dd),
      800: Color(0xFF162A49),
      900: Color(0xFF162A49),
    },
  );
}
