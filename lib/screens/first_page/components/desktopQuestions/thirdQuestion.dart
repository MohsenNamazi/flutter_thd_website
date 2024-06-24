import 'dart:async';
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

  @override
  void initState() {
    // TODO: implement initState
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
    return Container(
      alignment: Alignment.center,
      height: 500,
      width: MediaQuery.of(context).size.width - 340,
      padding: widget.skip
          ? EdgeInsets.only(top: 140, bottom: 60, left: 15, right: 15)
          : EdgeInsets.only(top: 140, bottom: 60, left: 60, right: 60),
      child: Container(
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.skip ? 1 : 4,
            crossAxisSpacing: widget.skip ? 5 : 20,
            mainAxisSpacing: widget.skip ? 5 : 20,
            childAspectRatio: widget.skip ? (6 / 1) : (2 / 1),
          ),
          itemBuilder: (
            context,
            index,
          ) {
            return tile(
                list[index]);
          },
        ),
      ),
    );
  }

  Widget tile(List data) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          userSelections.field = data[0];
          userSelections.youtubeLink = data[2];
          userSelections.link = data[3];
          widget.streamController.add(3);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: Colors.white,
          child: Stack(
            children: [
              if (!widget.skip)
                Container(
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("pics/" + data[1]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if (!widget.skip)
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
              if (widget.skip)
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
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
      ),
    );
  }
}
