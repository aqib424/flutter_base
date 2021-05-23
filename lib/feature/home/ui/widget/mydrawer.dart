import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            child: Center(
              child: Icon(
                Icons.settings,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
