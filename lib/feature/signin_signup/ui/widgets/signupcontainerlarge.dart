import 'package:flutter/material.dart';

class SignupContainerLarge extends StatelessWidget {
  Function onPressed;
  SignupContainerLarge({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70, //0.75

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: RotatedBox(
            quarterTurns: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                FloatingActionButton(
                  onPressed: onPressed,
                  backgroundColor: Color(0xFFF421325),
                  child: Icon(Icons.arrow_downward),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Login your Account',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 70,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      hintText: 'Email Address',
                      suffixIcon: Icon(
                        Icons.mail_outline,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 70,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      hintText: 'Password',
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 70,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'By Signing in, you agreed to our ',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      TextSpan(
                        text: 'terms of use',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: Offset(
                            5,
                            10,
                          ),
                        ),
                      ]),
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text('Sign In'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
    path.quadraticBezierTo(0, 0, 0, 50);
    path.lineTo(0, size.height - 190);

    path.quadraticBezierTo(
        0, (size.height * 0.65) + 40, 30, (size.height * 0.65) + 55);
    path.quadraticBezierTo(
        30, (size.height * 0.65) + 55, size.width - 70, size.height - 10);
    path.quadraticBezierTo(
        size.width, size.height + 20, size.width, size.height - 50);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 50);
    path.quadraticBezierTo(size.width, 0, size.width - 50, 0);

    path.close();

    paint.color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
