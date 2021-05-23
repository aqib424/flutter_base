import 'package:flutter/material.dart';

class SigninContainerLarge extends StatelessWidget {
  Function onPressed;
  SigninContainerLarge({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70, //0.75

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Sign Up',
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
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 45,
                  right: 45,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    hintText: 'Name',
                    suffixIcon: Icon(
                      Icons.assignment_ind_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 45,
                  right: 45,
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
                  left: 45,
                  right: 45,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    hintText: 'Phone Number',
                    suffixIcon: Icon(
                      Icons.phone,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 45,
                  right: 45,
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
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 45,
                  right: 45,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    hintText: 'PUBG ID',
                    suffixIcon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 45,
                  right: 45,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Signing in, you agreed to our ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'terms of use',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                      child: Text('Sign Up'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: onPressed,
                    backgroundColor: Color(0xFFFFC7C01),
                    child: Icon(Icons.arrow_upward),
                  ),
                ],
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
