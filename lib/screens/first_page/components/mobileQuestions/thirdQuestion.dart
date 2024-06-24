import 'dart:async';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thd_tfrs/model/fieldSelection.dart';
import 'package:thd_tfrs/storage/storage.dart';

class third extends StatefulWidget {
  StreamController<int> streamController;
  bool skip;

  third({this.streamController, this.skip});

  @override
  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {
  List list;

  final _scrollController = FixedExtentScrollController();
  final double _itemHeight = 150.0;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  void initState() {
    super.initState();
    list = [];
    if (userSelections.MsBr == 'bachelor') {
      switch (userSelections.faculty) {
        case 'civi':
          list.addAll(storage.Bcivil);
          break;
        case 'eco':
          list.addAll(storage.Beco);
          break;
        case 'elec':
          list.addAll(storage.Btec);
          break;
        case 'mech':
          list.addAll(storage.Beng);
          break;
        case 'natu':
          list.addAll(storage.Bnat);
          break;
        case 'heal':
          list.addAll(storage.Bhealth);
          break;
        case 'comp':
          list.addAll(storage.Bcom);
          break;
        case 'ecri':
          list.addAll(storage.BECRI);
          break;
        default:
          list = [];
          break;
      }
    } else {
      switch (userSelections.faculty) {
        case 'civi':
          list.addAll(storage.Mcivil);
          break;
        case 'eco':
          list.addAll(storage.Meco);
          break;
        case 'elec':
          list.addAll(storage.Mtec);
          break;
        case 'mech':
          list.addAll(storage.Meng);
          break;
        case 'natu':
          list.addAll(storage.Mnat);
          break;
        case 'comp':
          list.addAll(storage.Mcom);
          break;
        case 'ecri':
          list.addAll(storage.MECRI);
          break;
        default:
          list = [];
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.skip
        ? Container()
        : ClickableListWheelScrollView(
            scrollController: _scrollController,
            itemHeight: _itemHeight,
            itemCount: list.length,
            onItemTapCallback: (index) {
              userSelections.field = list[index][0];
              userSelections.youtubeLink = list[index][2];
              userSelections.link = list[index][3];
              widget.streamController.add(3);
            },
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: _itemHeight,
              physics: FixedExtentScrollPhysics(),
              overAndUnderCenterOpacity: 0.5,
              perspective: 0.002,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) => tile(list[index]),
                childCount: list.length,
              ),
            ),
          );
  }

  Widget tile(List data) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("pics/" + data[1]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                color: Colors.black.withOpacity(0.8),
                alignment: Alignment.center,
                child: Text(
                  data[0],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
