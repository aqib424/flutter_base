import 'dart:ui';
import 'package:flutter/material.dart';

import 'tabs/home_tab.dart';
import 'tabs/menu_tab.dart';
import 'tabs/settings_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List tabs = [
      MenuTab(),
      HomeTab(),
      SettingsTab(),
    ];
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuTab(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFC7C01),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 28,
                color: Colors.white,
              ),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFF421325),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              size: 28,
              color: Colors.white,
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFF421325),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.settings,
              size: 28,
              color: Colors.white,
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFF421325),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: _currentIndex != 0 ? tabs[_currentIndex] : null,
    );
  }
}
