import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

class footerText extends StatefulWidget {
  String txt;

  footerText({this.txt});

  @override
  _footerTextState createState() => _footerTextState(txt);
}

class _footerTextState extends State<footerText> {
  String txt;
  bool hover = false;

  _footerTextState(this.txt);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => secondPageDesktop(
                      feedback: txt,
                      description: "Footer",
                    )),
          );
        },
        child: Container(
          child: Text(
            txt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: hover ? TextDecoration.underline : null,
            ),
          ),
        ),
      ),
    );
  }
}
