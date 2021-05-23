import 'package:flutter/material.dart';

class SigninContainerSmall extends StatelessWidget {
  Function onPressed;
  SigninContainerSmall({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25, //0.75
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: onPressed,
                backgroundColor: Color(0xFFF421325),
                child: Icon(Icons.arrow_downward),
              ),
            ],
          ),
        ),
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

    path.moveTo(50, 0);
    path.quadraticBezierTo(0, 0, 0, 40);
    path.lineTo(0, size.height - 160);
    path.quadraticBezierTo(
        0, (size.height - 150) + 18, 30, (size.height - 150) + 30);

    path.lineTo(size.width - 60, size.height + 20);
    path.quadraticBezierTo(
        size.width, size.height + 50, size.width, size.height - 5);

    path.lineTo(size.width, 50);
    path.quadraticBezierTo(size.width, 0, size.width - 50, 0);

    // path.moveTo(50, 0);
    // path.quadraticBezierTo(0, 0, 0, 50);
    // path.lineTo(0, size.height * 0.65);

    // path.quadraticBezierTo(
    //     0, (size.height * 0.65) + 40, 30, (size.height * 0.65) + 55);
    // path.quadraticBezierTo(
    //     30, (size.height * 0.65) + 55, size.width - 70, size.height + 0);
    // path.quadraticBezierTo(
    //     size.width, size.height + 40, size.width, size.height - 30);
    // path.lineTo(size.width, size.height);

    // path.lineTo(size.width, 50);
    // path.quadraticBezierTo(size.width, 0, size.width - 50, 0);

    // path.close();

    paint.color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
