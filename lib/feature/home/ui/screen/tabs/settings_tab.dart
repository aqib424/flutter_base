import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/ui/widget/buttoncontainer.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
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
            ButtonContainer(
              title: 'Help and Support',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            ButtonContainer(
              title: 'Profile',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ButtonContainer(
              title: 'Change Password',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ButtonContainer(
              title: 'Logout',
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Text(
              'Bugs and Report',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
