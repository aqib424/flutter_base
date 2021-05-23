import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/buttoncontainer.dart';

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  Color color = Color(0xFFFF5EEE6);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: Color(0xFFFFC7C01),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('images/pubgimg.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Abdul Manan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Your Amount : 200 Pkr',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ButtonContainer(
            title: 'Matches History',
            onTap: () {},
            color: color,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ButtonContainer(
            title: 'Transaction History',
            onTap: () {},
            color: color,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ButtonContainer(
            title: 'Add Money',
            onTap: () {},
            color: color,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ButtonContainer(
            title: 'Redeem',
            onTap: () {},
            color: color,
          ),
        ],
      ),
    );
  }
}
