import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  Function onTap;
  String title;
  Color color;
  ButtonContainer({
    this.title,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: color == null ? Color(0xFFFC4C4C4) : color,
              height: 70,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
