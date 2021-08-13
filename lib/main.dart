import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/provider/persons_provider.dart';
import 'package:whatsapp/screens/calls_screen.dart';
import 'package:whatsapp/screens/chats_screen.dart';
import 'package:whatsapp/screens/contacts_screen.dart';
import 'helpers/colors.dart';
import 'screens/camera_screen.dart';
import 'screens/save_camera_screen.dart';
import 'screens/status_screen.dart';
import 'widgets/tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> PersonsProvider(),
      
      child: MaterialApp(
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
          SaveCameraScreen.routeName: (ctx) => SaveCameraScreen(),
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  int _tabIdx = 1;
  // late AnimationController _colorAnimationController;
  // late Animation<Color?> _colorAnimation;
  List<FloatingActionButton?> fabs = [
    null,
    FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.chat),
    ),
    FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.camera_alt),
    ),
    FloatingActionButton(onPressed: () {}, child: Icon(Icons.call)),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(updateScreenForFab);
    // _colorAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 3));
    // _colorAnimation = ColorTween(begin: Colors.red, end: Colors.amber).animate(
    //     (CurvedAnimation(
    //         parent: _colorAnimationController, curve: Curves.linear)));
  }

  // void _handleChangeToCameraTab() {
  //   final value = ;

  //   if (value! < 1) {
  //     _scrollController
  //         .jumpTo(_scrollController.position.maxScrollExtent * (1.0 - value));
  //   }

  //   _pinned = value >= 1.0;
  // }

  void updateScreenForFab() {
    setState(() {
      _tabIdx = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (ctx, isInnerBoxScrolled) {
            // _colorAnimationController.forward();
            return [
              SliverAppBar(
                // toolbarHeight: _heightAnimation!.value.height,
                title: Text(
                  "Whatsapp",
                ),
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
