import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 8, size.width, size.width, size.height);
    // path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    // path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    // path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    // path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    // path.close();
    path.lineTo(size.width, size.height + 10);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Color(0xFFFFC7C01);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
