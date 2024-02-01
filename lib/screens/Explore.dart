import 'package:final_project/main.dart';

import 'package:final_project/tabs/LocationTab.dart';
import 'package:final_project/utils/Custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late TabController controller;
  static const List<String> _options=<String> ['Aspen,USA','Jordan,Amman'];
  String _selectNation="";
  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(children: [Row(children:
                                 [Column(children: [
                      Text("Explore",style: TextStyle(fontFamily: "Montserrat",fontSize: 14,fontWeight:FontWeight.w400),),
                                   Text("Aspen",style: TextStyle(fontFamily: "Montserrat",fontSize: 32,fontWeight:FontWeight.w500),)],)],
        )
        ],)

    );
  }

  void tabs() {
    TabBar(tabs: [
      Tab(
        child: Text("Location", style: TextStyle(fontFamily: "CircularXX", fontSize: 14,color: Colors.black26),
        ), // 0
      ),
      Tab(
        child: Text("Hotels",style: TextStyle(fontFamily: "CircularXX", fontSize: 14,color: Colors.black26),), // 1
      ),
      Tab(
        child: Text("Food",style: TextStyle(fontFamily: "CircularXX", fontSize: 14,color: Colors.black26),), // 2
      ), // 2),
      Tab(
        child: Text("Adventure",style: TextStyle(fontFamily: "CircularXX", fontSize: 14,color: Colors.black26),), // 2
      ),
      Tab(
        child: Text("Adventure",style: TextStyle(fontFamily: "CircularXX", fontSize: 14),), // 2
      ),
    ],
      controller: controller,
      enableFeedback: false, // sound
      labelColor: Colors.red,
      unselectedLabelColor: Colors.black26,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.blueAccent, Colors.blueAccent]),
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.all(0),
      isScrollable: true,
      indicatorWeight: 10,
      indicatorPadding: const EdgeInsets.all(10),


    );
    TabBarView(
      controller: controller,
      children: [LocationTab(),
        Container(),
        Container(),
        Container(),
        Container()
      ],
    );
  }
void dropdown(){
    SingleChildScrollView(child: Column(children: [CustomSearchableDropDown(
        items: _options,
        label: "select Nation",
        menuMode: true,
        hideSearch: true,
        menuHeight: 100,
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        multiSelect: false,

        onChanged:(value){
          setState(() {
            _selectNation=value;
          });
        },
        dropDownMenuItems: _options.map((item) {
          return item;
        }).toList() ?? []


    )],),);
}

}
