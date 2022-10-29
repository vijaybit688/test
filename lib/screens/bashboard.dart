import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_flutter/screens/home_screen.dart';

import 'setting.dart';

int selectedIndexValue = 0;
int index = 0;
PageController pageController = PageController();

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.grey,
          tabMargin: EdgeInsets.all(8),
          tabBackgroundColor: Colors.blueAccent,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          gap: 8,
          selectedIndex: selectedIndexValue,
          onTabChange: onTabChanged,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: TextStyle(fontSize: 28),
              iconSize: 28,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
              textStyle: TextStyle(fontSize: 28),
              iconSize: 28,
            ),
          ],
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.print,
            color: Colors.white,
          ),
          title: Text(
            "Flutter Task",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [HomeScreen(), Setting()],
        ));
  }

  onTabChanged(int _tabIndex) {
    pageController.animateToPage(_tabIndex,
        duration: Duration(microseconds: 400), curve: Curves.ease);
  }

  onPageChanged(int _pageIndex) {
    setState(() {
      selectedIndexValue = _pageIndex;
    });
  }
}
