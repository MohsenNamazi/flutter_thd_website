import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

class gridView extends StatefulWidget {
  const gridView({Key key}) : super(key: key);

  @override
  _gridViewState createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    int axisCount = 1;

    if (widthScreen <= 800) widthScreen = 1;
    if (widthScreen > 800 && widthScreen < 1400) axisCount = 2;
    if (widthScreen >= 1400) axisCount = 3;

    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: axisCount,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: 'INFORMATION ABOUT\nTHE SUMMER\nSEMESTER 2021.', description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "INFORMATION ABOUT\nTHE SUMMER\nSEMESTER 2021.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.lightBlue,
          child: Container(),
          /*        child: FlutterYoutube.playYoutubeVideoByUrl(
                                        apiKey: "AIzaSyBb9oy6DCL4FFcJESElA0A8Hh6fxYG_cIs",
                                        videoUrl: "https://youtu.be/I373MGFafq4",
                                        autoPlay: true, //default falase
                                        fullScreen: true //default false
                                    ),*/
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: 'Events', description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "EVENTS.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "EXPLORE YOUR UNIVERSITY.",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/Vogel.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: 'CURRENT INFORMATION\nCONCERNING THE\nCORONAVIRUS.', description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "CURRENT INFORMATION\nCONCERNING THE\nCORONAVIRUS.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: 'APPLY NOW.', description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.indigo,
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "APPLY NOW.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.only(top: 20),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/Uhr.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "87%", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "87%",
                                style: TextStyle(fontSize: 45, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                     Expanded(
                       flex: 2,
                       child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Of all graduates\nfind a job within\n2 months of graduation.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                     ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: 80,
                                height: 80,
                                margin: EdgeInsets.only(top: 20),
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage("images/absolvent.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container()
                    ]),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "13 LOCATIONS", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "13 LOCATIONS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "DEGGENDORF.\nPFARRKIRCHEN.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(top: 20),
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/standorte.webp"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "10 TECHNOLOGY CAMPUSES.\n1 HEALTHCARE CAMPUS.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "BACHELOR.\nMASTER", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(15),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "BACHELOR.\nMASTER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "INTERNATIONAL\nRECOGNITION OF\nEXCELLENCE.", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.blue,
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "INTERNATIONAL\nRECOGNITION OF\nEXCELLENCE.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage("images/cer1.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage("images/cer2.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "DIT IS ONE OF THE TOP 25 PERFORMERS WORLDWIDE.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "195 PARTNER UNIS.", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "195 PARTNER UNIS.",
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage("images/weltkugel.webp"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "WORLDWIDE NETWORK.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "7.941 STUDENTS", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "7.941 STUDENTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("images/Studierende.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "29% INTERNATIONAL\nSTUDENTS.", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.indigo,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "29% INTERNATIONAL\nSTUDENTS.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("images/IMG.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "FIND OUT MORE.", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "FIND OUT MORE.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("images/blog-klein.webp"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "READ EXCITING REPORTS AND REVIEWS ABOUT DIT. WRITTEN BY STAFF AND STUDENT AUTHORS.",
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "FIELDS OF RESEARCH.", description: "gridview",)),
              );
            },
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "FIELDS OF RESEARCH.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("images/mikroskop.webp"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "DIGITIZATION. MOBILITY.\nHEALTH. SUSTAINABILITY.",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
