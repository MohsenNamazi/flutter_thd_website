import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

class news extends StatefulWidget {
  const news({Key key}) : super(key: key);

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {

  bool loadMore1 = false;
  bool loadMore2 = false;
  bool loadMore3 = false;
  bool loadMore4 = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage(
                                    "images/news1.webp"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              margin:
                              EdgeInsets.only(bottom: 10),
                              color: Colors.white,
                              alignment: Alignment.topLeft,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'DigiCamp on AI study programmes',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      360),
                                  color: Colors.indigo),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'The Department of Digitalisation and Innovative Teaching at the Deggendorf Institute of Technology will present the university\'s new English-lan...',
                          maxLines: 3,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (event) {
                          setState(() {
                            loadMore1 = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            loadMore1 = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "First", description: "News",)),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: loadMore1
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black)),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 3,
                                    bottom: 3),
                                child: Text(
                                  "+ Load more",
                                  style: TextStyle(
                                    color: !loadMore1
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage(
                                    "images/news2.webp"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              margin:
                              EdgeInsets.only(bottom: 10),
                              color: Colors.white,
                              alignment: Alignment.topLeft,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Best conditions',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      360),
                                  color: Colors.indigo),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'With over 300 square metres of new space in the ITC2 in Deggendorf, the Startup Campus of the Deggendorf Institute of Technology (DIT) is creating roo...',
                          maxLines: 3,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (event) {
                          setState(() {
                            loadMore2 = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            loadMore2 = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Second", description: "News",)),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: loadMore2
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black)),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 3,
                                    bottom: 3),
                                child: Text(
                                  "+ Load more",
                                  style: TextStyle(
                                    color: !loadMore2
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage(
                                    "images/news3.webp"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              margin:
                              EdgeInsets.only(bottom: 10),
                              color: Colors.white,
                              alignment: Alignment.topLeft,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Network under construction',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 5,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 250,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 15,
                              width: 15,
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      360),
                                  color: Colors.indigo),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'The Deggendorf Institute of Technology (DIT) is once again receiving funding to intensify its start-up work. As part of the funding priority "regional...',
                          maxLines: 3,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (event) {
                          setState(() {
                            loadMore3 = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            loadMore3 = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Third", description: "News",)),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: loadMore3
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.black)),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 3,
                                    bottom: 3),
                                child: Text(
                                  "+ Load more",
                                  style: TextStyle(
                                    color: !loadMore3
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  loadMore4 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  loadMore4 = false;
                });
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Main", description: "News",)),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color:
                      loadMore4 ? Colors.black : Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 3, bottom: 3),
                      child: Text(
                        "+ Load more",
                        style: TextStyle(
                          color: !loadMore4
                              ? Colors.black
                              : Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
