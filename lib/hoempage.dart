import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

import 'screens/homescreen.dart';

class Hoempage extends StatefulWidget {
  const Hoempage({super.key});

  @override
  State<Hoempage> createState() => _HoempageState();
}

class _HoempageState extends State<Hoempage> {
  int selectedIndex = 0;

  Widget buildBody() {
    switch(selectedIndex){
      case 0: return const Homescreen();
      case 1: return const Center(child: Text("Transaction History"));
      case 2: return const Center(child: Text("Transaction History"),);
      case 3: return const Center(child: Text("Transaction History"),);
      case 4: return const Center(child: Text("Profile"),);
      default: return const Center();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Homescreen(),
     bottomNavigationBar: CurvedNavigationBar(
       animationDuration: Duration(milliseconds: 300),
       index: selectedIndex,
       onTap: (value){
         setState(() {
           selectedIndex=value;
         });
       },
       backgroundColor: Stylings.bgColor,
       color: Colors.white60,
       items: [
       Icon(FluentIcons.home_48_regular),
       Icon(FluentIcons.search_48_regular),
       Icon(FluentIcons.bookmark_32_regular),
       Icon(FluentIcons.person_24_regular)
     ],

     ),
    );
  }
}
