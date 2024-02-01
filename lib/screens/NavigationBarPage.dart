import 'package:final_project/main.dart';
import 'package:final_project/screens/Explore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationBarpage extends StatefulWidget {
  const NavigationBarpage({super.key});

  @override
  State<NavigationBarpage> createState() =>_NavigationState();
}

class _NavigationState extends State<NavigationBarpage> {

  int index = 0;
  List<TabModel> _tabs=[
    TabModel(View:Explore()),
    TabModel(View:Container()),
    TabModel(View:Container()),
    TabModel(View:Container()
    )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body:_persistantTabbar()
    );
  }

  Widget _persistantTabbar() {
    return PersistentTabView(
      context,
      screens: _tabs.map((e) => e.View).toList(),
      navBarHeight: 100,
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),

            activeColorPrimary: index == 0 ? Colors.blueAccent : Colors.black38),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.airplane_ticket),

            activeColorPrimary: index == 1 ? Colors.blueAccent : Colors.black38),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.favorite),

            activeColorPrimary: index == 2 ? Colors.blueAccent : Colors.black38),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.person),

            activeColorPrimary: index == 3 ? Colors.blueAccent : Colors.black38),
      ],
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
      // optional
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}
class TabModel{
  Widget View;
  Widget ? icon;


  TabModel({required this.View, this.icon});

}
