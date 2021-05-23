import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _current = 0;
  List items = [1, 2, 3, 4, 5];

  var carousalController1 = CarouselControllerImpl();
  var carousalController2 = CarouselControllerImpl();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/mainpic.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Matches',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider(
                      carouselController: carousalController1,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * .29,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: items.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  colors: [
                                    Color(0xFFF421325),
                                    Color(0xFFFFC7C01),
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            size: 45,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              carousalController1
                                                  .previousPage();
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 45,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            carousalController1.nextPage();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'PUBG',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Squad',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Fee: 50',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                spreadRadius: 1,
                                                blurRadius: 0.1,
                                                offset: Offset(
                                                  5,
                                                  5,
                                                ),
                                              ),
                                            ]),
                                            child: FlatButton(
                                              color: Colors.white,
                                              onPressed: () {},
                                              child: Text('Participate'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: items.map((url) {
                        int index = items.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: (MediaQuery.of(context).size.width / 2) - 75,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/pubgimg.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider(
                      carouselController: carousalController2,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * .29,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: items.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  colors: [
                                    Color(0xFFF421325),
                                    Color(0xFFFFC7C01),
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            size: 45,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              carousalController2
                                                  .previousPage();
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 45,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            carousalController2.nextPage();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'PUBG',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Squad',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Fee: 50',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                spreadRadius: 1,
                                                blurRadius: 0.1,
                                                offset: Offset(
                                                  5,
                                                  5,
                                                ),
                                              ),
                                            ]),
                                            child: FlatButton(
                                              color: Colors.white,
                                              onPressed: () {},
                                              child: Text('Participate'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: items.map((url) {
                        int index = items.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: (MediaQuery.of(context).size.width / 2) - 75,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/pubgimg.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
