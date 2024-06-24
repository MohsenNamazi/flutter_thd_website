import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thd_tfrs/model/fieldSelection.dart';

class second extends StatefulWidget {
  StreamController<int> streamController;
  bool skip;

  second({this.streamController, this.skip});

  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 20.0,
          spacing: widget.skip ? 5 : 40.0,
          direction: widget.skip ? Axis.vertical : Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (widget.skip)
              Container(
                height: 100,
              ),
            tile(
                pic: 'civil.webp',
                title: 'Civil and Construction Engineering',
                tag: 'civi'),
            tile(pic: 'economic.webp', title: 'Applied Economics', tag: 'eco'),
            tile(
                pic: 'electrical.webp',
                title: 'Electrical Engineering and Media Technology',
                tag: 'elec'),
            tile(
                pic: 'mechanical.webp',
                title: 'Mechanical Engineering and Mechatronics',
                tag: 'mech'),
            tile(
                pic: 'NaturalSciences.webp',
                title: 'Applied Natural Sciences and Industrial Engineering',
                tag: 'natu'),
            tile(
                pic: 'healthcare.webp',
                title: 'Applied Healthcare Sciences',
                tag: 'heal'),
            tile(pic: 'computer.webp', title: 'Computer Science', tag: 'comp'),
            tile(
                pic: 'ECRI.webp',
                title: 'European Campus Rottal-Inn',
                tag: 'ecri'),
            if (widget.skip)
              Container(
                height: 100,
              ),
          ],
        ),
      ),
    );
  }

  Widget tile({String pic, String title, String tag}) {
    double h = widget.skip ? 50 : 100;
    double w = widget.skip ? 350 : 200;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          userSelections.faculty = tag;
          widget.streamController.add(2);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: w,
          height: h,
          child: Stack(
            children: [
              if (!widget.skip)
                Container(
                  width: w,
                  height: h,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("pics/" + pic),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Container(
                width: w,
                height: h,
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: w,
                  height: 50,
                  color: Colors.white.withOpacity(0.8),
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
