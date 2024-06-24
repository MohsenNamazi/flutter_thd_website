import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:thd_tfrs/screens/first_page/components/appBar.dart';
import 'package:thd_tfrs/screens/first_page/components/chatBot.dart';
import 'package:thd_tfrs/screens/first_page/components/facultiesLinks.dart';
import 'package:thd_tfrs/screens/first_page/components/footer.dart';
import 'package:thd_tfrs/screens/first_page/components/news.dart';
import 'package:thd_tfrs/screens/first_page/components/recommender.dart';
import 'package:thd_tfrs/screens/first_page/components/appBarMobile.dart';
import 'package:thd_tfrs/screens/first_page/components/gridView.dart';
import 'package:thd_tfrs/screens/first_page/components/recommenderMobile.dart';

import '../../translations.dart';

class firstPageDesktop extends StatefulWidget {
  const firstPageDesktop({Key key}) : super(key: key);

  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPageDesktop> {
  bool showNot = false;
  bool interact = false;
  bool firstShow = false;
  bool playSound = false;

  double widthScreen;
  double padding;

  var duration;
  var playerSit;

  @override
  Future<void> initState() {
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    padding = widthScreen / 10;

    return Scaffold(
      body: Listener(
        onPointerDown: (e) {
          FocusScope.of(context).unfocus();
          playSound = true;
        },
        onPointerSignal: (pointerSignal) {
          setState(() {
            interact = true;
          });
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.white, BlendMode.dstATop),
                        image: new AssetImage("images/first_page.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(60),
                        margin: EdgeInsets.only(top: 100),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allTranslations.text('APPLYNOWTOSTART'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 6.0,
                                ),
                              ),
                              Text(
                                allTranslations.text("description"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 6.0,
                                ),
                              ),
                            ])),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      allTranslations.text("StudyResearch"),
                      style: TextStyle(
                        color: Color(0xFF1a4273),
                        fontSize: 40,
                        letterSpacing: 8.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        allTranslations.text("DiscoverOur"),
                        style: TextStyle(
                          color: Color(0xFF1a4273),
                          fontSize: 30,
                          letterSpacing: 8.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  facultiesLinks(),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: padding, right: padding),
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        gridView(),
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        if (widthScreen >= 750) recommender(),
                        if (widthScreen < 750) recommenderMobile(),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              allTranslations.text("newsC"),
                              style:
                                  TextStyle(fontSize: 35, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        news(),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  footer(),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            if (widthScreen < 1400) appBarTablet(),
            if (widthScreen >= 1400) appBarDesktop(),
            AnimatedPositioned(
              bottom: showNot ? 0 : -160,
              right: 30,
              duration: Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  firstShow = true;
                  setState(() {
                    showNot = !showNot;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: showNot ? 300 : 150,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(color: Colors.black),
                                borderRadius: showNot
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  allTranslations.text("notification"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          chatBot(),
                        ],
                      ),
                      if (!showNot)
                        Container(
                          height: 40,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: Colors.red,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      if (showNot)
                        Container(
                          height: 40,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            height: 25,
                            width: 25,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
