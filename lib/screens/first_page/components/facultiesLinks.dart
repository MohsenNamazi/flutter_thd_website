import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';
import 'package:thd_tfrs/translations.dart';

class facultiesLinks extends StatefulWidget {
  const facultiesLinks({Key key}) : super(key: key);

  @override
  _facultiesLinksState createState() => _facultiesLinksState();
}

class _facultiesLinksState extends State<facultiesLinks> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            faculty(Colors.green, allTranslations.text("CivilEngineering")),
            faculty(Colors.red, allTranslations.text("AppliedEconomics")),
            faculty(
                Colors.yellow, allTranslations.text("ElectricalEngineering")),
            faculty(Colors.blue, allTranslations.text("MedicalEngineering")),
            faculty(Colors.purple, allTranslations.text("AppliedNatural")),
            faculty(Colors.orange, allTranslations.text("AppliedNatural")),
            faculty(Colors.redAccent, allTranslations.text("ComputerScience")),
            faculty(Colors.blueGrey, allTranslations.text("EuropeanCampus")),
          ],
        ),
      ],
    );
  }
}

class faculty extends StatefulWidget {
  Color fColor;
  String fName;

  faculty(this.fColor, this.fName);

  @override
  _facultyState createState() => _facultyState();
}

class _facultyState extends State<faculty> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  bool hover = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 400),
    );
    _animation = Tween(begin: 0.0, end: -12.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (hover) _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          hover = true;
        });
        _controller.forward();
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
                      feedback: widget.fName,
                  description: "faculty_circle_list",
                    )),
          );
        },
        child: Container(
          padding: EdgeInsets.only(left: 4, right: 4),
          child: Tooltip(
            message: widget.fName,
            child: AnimatedBuilder(
              animation: _animation,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: widget.fColor,
                ),
                height: 25,
                width: 25,
              ),
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
