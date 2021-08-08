import 'package:flutter/material.dart';
import 'package:whatsapp/screens/calls_screen.dart';
import 'package:whatsapp/screens/chats_screen.dart';
import 'package:whatsapp/screens/contacts_screen.dart';
import 'helpers/colors.dart';
import 'screens/camera_screen.dart';
import 'screens/status_screen.dart';
import 'widgets/tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
            backgroundColor: MyColors.whatsapp[300]),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        ContactsScreen.routeName: (ctx) => ContactsScreen(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _tabIdx = 1;
  late final AnimationController animeController;
  Animation<Size>? _heightAnimation;
  List<FloatingActionButton?> fabs = [
    null,
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.chat)),
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.camera_alt)),
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.call)),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(updateScreenForFab);

    animeController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 112), end: Size(double.infinity, 0))
        .animate(
      CurvedAnimation(
        parent: animeController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void updateScreenForFab() {
    setState(() {
      _tabIdx = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    animeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (ctx, isInnerBoxScrolled) {
            return [
              SliverAppBar(
                // toolbarHeight: _heightAnimation!.value.height,
                title: Text("Whatsapp"),
                pinned: true,
                floating: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: Tabs.build(context),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              CameraScreen(),
              ChatsScreen(),
              StatusScreen(),
              CallsScreen()
            ],
          ),
        ),
        floatingActionButton: fabs[_tabIdx]);
  }
}
