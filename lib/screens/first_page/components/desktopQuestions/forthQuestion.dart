import 'dart:async';

import 'package:flutter/material.dart';

class fourth extends StatefulWidget {
  StreamController<int> streamController;
  bool skip;

  fourth({this.streamController, this.skip});

  @override
  _fourthState createState() => _fourthState();
}

class _fourthState extends State<fourth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

    );
  }
}
