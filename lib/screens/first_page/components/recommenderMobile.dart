import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thd_tfrs/model/fieldSelection.dart';
import 'package:thd_tfrs/screens/first_page/components/mobileQuestions/firstQuestion.dart';
import 'package:thd_tfrs/screens/first_page/components/mobileQuestions/forthQuestion.dart';
import 'package:thd_tfrs/screens/first_page/components/mobileQuestions/secondQuestion.dart';
import 'package:thd_tfrs/screens/first_page/components/mobileQuestions/thirdQuestion.dart';
import 'package:thd_tfrs/translations.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class recommenderMobile extends StatefulWidget {
  const recommenderMobile({Key key}) : super(key: key);

  @override
  _recommenederState createState() => _recommenederState();
}

class _recommenederState extends State<recommenderMobile> {
  PageController pageController = PageController();
  StreamController<int> streamController;
  Stream stream;
  int pageIndex = 0;
  Color blue = Colors.blue;
  Color white = Colors.white;
  bool skip = false;
  double widthScreen;

  progressBarBall(Color col1, Color col2) {
    return Container(
      width: skip ? 30 : 40,
      height: skip ? 30 : 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360),
        color: pageIndex != 3 ? col1 : Colors.green,
      ),
      child: Container(
        width: skip ? 15 : 25,
        height: skip ? 15 : 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: pageIndex != 3 ? col2 : Colors.green,
        ),
      ),
    );
  }

  showLine(bool condition) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 1,
      width: skip ? 30 : 60,
      color: pageIndex == 3
          ? Colors.green
          : condition
              ? blue
              : white,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController = StreamController<int>();
    stream = streamController.stream;
    stream.listen((value) {
      if (skip) {
        setState(() {
          skip = false;
        });
      } else {
        pageController.animateToPage(value,
            duration: Duration(milliseconds: 200), curve: Curves.linear);
        setState(() {
          pageIndex = value;
          userSelections.pageNumber = value;
          if (pageIndex == 3) skip = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        youtubeVideo(skip),
        Container(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: widthScreen * 9 / 10,
            height: skip ? 50 : 500,
            child: Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          skip = !skip;
                        });
                        pageController.jumpToPage(pageIndex);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          height: 50,
                          width:  widthScreen * 9 / 10,
                          color: Colors.black.withOpacity(0.6),
                          alignment: Alignment.center,
                          child: Text(
                            allTranslations.text("clickHere"),
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(

                      height: skip ? 0 : 500,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Container(
                              color: Colors.black.withOpacity(0.6),
                              width: widthScreen * 9 / 10,
                              height: 500,
                              child: PageView(
                                controller: pageController,
                                physics: new NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  first(
                                    streamController: streamController,
                                  ),
                                  second(
                                    streamController: streamController,
                                    skip: skip,
                                  ),
                                  third(
                                    streamController: streamController,
                                    skip: skip,
                                  ),
                                  fourth(
                                    streamController: streamController,
                                    skip: skip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: 100,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 5,
                                  child: Text(
                                    allTranslations.text("letUsKnow"),
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 25,
                                  child: Text(
                                    allTranslations.text("chooseOption"),
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      progressBarBall(blue, pageIndex == 0 ? white : blue),
                                      showLine(true),
                                      progressBarBall(pageIndex >= 1 ? blue : white,
                                          pageIndex > 1 ? blue : white),
                                      showLine(pageIndex >= 1),
                                      progressBarBall(pageIndex >= 2 ? blue : white,
                                          pageIndex > 2 ? blue : white),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 200),
                            bottom: pageIndex == 3 ? 200 : 0,
                            left: 0,
                            right: 0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (skip) {
                                        setState(() {
                                          skip = false;
                                        });
                                      } else {
                                        if (pageIndex > 0)
                                          pageController.previousPage(
                                              duration: Duration(milliseconds: 200),
                                              curve: Curves.linear);
                                        setState(() {
                                          pageIndex--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Visibility(
                                        visible: pageIndex == 0 || pageIndex == 5
                                            ? false
                                            : true,
                                        child: Text(
                                          allTranslations.text("back"),
                                          style: TextStyle(
                                            color: Colors.white70,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (skip) {
                                        setState(() {
                                          skip = false;
                                        });
                                      } else {
                                        pageController.animateToPage(0,
                                            duration: Duration(milliseconds: 200),
                                            curve: Curves.linear);
                                        setState(() {
                                          skip = false;
                                          pageIndex = 0;
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Visibility(
                                        visible: pageIndex == 0 ? false : true,
                                        child: Text(
                                          allTranslations.text("reset"),
                                          style: TextStyle(
                                            color: Colors.white70,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !skip,
                            child: Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    skip = true;
                                  });
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10, right: 10),
                                    child: Text(
                                      allTranslations.text("skip"),
                                      style: TextStyle(
                                        color: Colors.white70,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
          ),
        ),
      ],
    );
  }
}

class youtubeVideo extends StatefulWidget {
  bool skip;

  youtubeVideo(this.skip);

  @override
  _youtubeVideoState createState() => _youtubeVideoState();
}

class _youtubeVideoState extends State<youtubeVideo> {
  String newLink = '';
  double widthScreen;

  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'nHNav5xMNcc',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 30),
      showControls: true,
      autoPlay: false,
    ),
  );

  updateLink() {
    if (userSelections.pageNumber == 3 && newLink != userSelections.youtubeLink)
      setState(() {
        newLink = userSelections.youtubeLink;
        controller = YoutubePlayerController(
          initialVideoId: userSelections.youtubeLink,
          params: YoutubePlayerParams(
            startAt: Duration(seconds: 30),
            showControls: true,
            autoPlay: false,
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    updateLink();

    return Visibility(
      visible: widget.skip,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 450,
            width: widthScreen * 9 / 10,
            child: Container(
              height: 400,
              child: YoutubePlayerControllerProvider(
                controller: controller,
                child: YoutubePlayerIFrame(
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: widthScreen * 9 / 10,
            child: Container(
              alignment: Alignment.center,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Text(
                    'Go to the course page',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
