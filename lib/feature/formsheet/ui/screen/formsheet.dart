import 'package:flutter/material.dart';

import 'form sheet tabs/playerfourtab.dart';
import 'form sheet tabs/playerthreetab.dart';
import 'form sheet tabs/playertwotab.dart';

class FormSheetScreen extends StatefulWidget {
  @override
  _FormSheetScreenState createState() => _FormSheetScreenState();
}

class _FormSheetScreenState extends State<FormSheetScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: Text(
                      'PUBG',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/pubgimg.png'),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: Text(
                      'Registeration',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Color(0xFFF1A113E),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Player 2',
                ),
                Tab(
                  text: 'Player 3',
                ),
                Tab(
                  text: 'Player 4',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PlayerTwoTab(),
                PlayerThreeTab(),
                PlayerFourTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
