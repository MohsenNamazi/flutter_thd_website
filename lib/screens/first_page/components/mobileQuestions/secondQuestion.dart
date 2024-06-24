import 'dart:async';

import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
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
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  List list = [
    ['civil.webp', 'Civil and Construction Engineering', 'civi'],
    ['economic.webp', 'Applied Economics', 'eco'],
    ['electrical.webp', 'Electrical Engineering and Media Technology', 'elec'],
    ['mechanical.webp', 'Mechanical Engineering and Mechatronics', 'mech'],
    [
      'NaturalSciences.webp',
      'Applied Natural Sciences and Industrial Engineering',
      'natu'
    ],
    ['healthcare.webp', 'Applied Healthcare Sciences', 'heal'],
    ['computer.webp', 'Computer Science', 'comp'],
    ['ECRI.webp', 'European Campus Rottal-Inn', 'ecri']
  ];

  final _scrollController = FixedExtentScrollController();
  final double _itemHeight = 150.0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return widget.skip ? Container() : ClickableListWheelScrollView(
      scrollController: _scrollController,
      itemHeight: _itemHeight,
      itemCount: list.length,
      onItemTapCallback: (index) {
        userSelections.faculty = list[index][2];
        widget.streamController.add(2);
      },
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: _itemHeight,
        physics: FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.5,
        perspective: 0.002,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => tile(
              pic: list[index][0],
              title: list[index][1],
              tag: list[index][2]),
          childCount: list.length,
        ),
      ),
    );
  }

  Widget tile({String pic, String title, String tag}) {
    double h = 200;
    double w = 350;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: w,
        height: h,
        child: Stack(
          children: [
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
    );
  }
}
