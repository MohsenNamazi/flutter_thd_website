import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

class appBarOneText extends StatefulWidget {

  String txt;
  appBarOneText({this.txt});


  @override
  _appBarOneTextState createState() => _appBarOneTextState(txt);
}

class _appBarOneTextState extends State<appBarOneText> {

  String txt;
  bool hover = false;

  _appBarOneTextState(this.txt);

  @override
  Widget build(BuildContext context) {
    return  MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: txt,description: "secondAppBar",)),
          );
        },
        child: Container(
          width: 200,
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
          child: Text(
            txt,
            style: TextStyle(color: Colors.white,
              decoration: hover ? TextDecoration.underline : null,),
          ),
        ),
      ),
    );
  }
}
