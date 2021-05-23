import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/bottombar.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/signincontainerlarge.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/signincontainersmall.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/signupcontainerlarge.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/signupcontainersmall.dart';
import 'package:flutter_boilerplate/feature/signin_signup/ui/widgets/topbar.dart';

class SignupLoginScreen extends StatefulWidget {
  @override
  _SignupLoginScreenState createState() => _SignupLoginScreenState();
}

class _SignupLoginScreenState extends State<SignupLoginScreen>
    with TickerProviderStateMixin {
  bool isToggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1A113E),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            TopBar(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedSize(
                vsync: this,
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: BottomBar(),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 20,
            //   right: 20,
            //   left: 20,
            //   top: MediaQuery.of(context).size.height * 0.20,
            //   child: AnimatedSize(
            //     vsync: this,
            //     duration: Duration(milliseconds: 150),
            //     curve: Curves.easeIn,
            //     child: RotatedBox(
            //       quarterTurns: 2,
            //       child: SignupContainerLarge(),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 20,
            //   right: 20,
            //   left: 20,
            //   child: AnimatedSize(
            //     vsync: this,
            //     duration: Duration(milliseconds: 150),
            //     curve: Curves.easeIn,
            //     child: SignupContainerSmall(),
            //   ),
            // ),
            isToggle
                ? Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    top: MediaQuery.of(context).size.height * 0.20,
                    child: AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SignupContainerLarge(
                          onPressed: () {
                            print('im tapped 1');
                            setState(() {
                              isToggle = true;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: MediaQuery.of(context).size.height * 0.20,
                    child: AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      child: SigninContainerLarge(
                        onPressed: () {
                          print('im tapped 2');
                          setState(() {
                            isToggle = false;
                          });
                        },
                      ),
                    ),
                  ),
            isToggle
                ? Positioned(
                    top: 20,
                    right: 20,
                    left: 20,
                    child: AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      child: SignupContainerSmall(
                        onPressed: () {
                          setState(() {
                            isToggle = false;
                          });
                        },
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SigninContainerSmall(
                          onPressed: () {
                            setState(() {
                              isToggle = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// class CurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     Paint paint = Paint();
//     // path.lineTo(-50, size.height);
//     // path.lineTo(size.width, size.height);
//     // path.quadraticBezierTo(size.width / 4, size.width, size.width, size.height);
//     // path.lineTo(size.width, 0);
//     // path.close();
//     //

//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(size.width / 8, size.width, size.width, size.height);
//     // path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
//     // path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
//     // path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
//     // path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
//     // path.close();
//     path.lineTo(size.width, size.height + 10);
//     path.lineTo(size.width, 0);
//     path.close();

//     paint.color = Color(0xFFF421325);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }
