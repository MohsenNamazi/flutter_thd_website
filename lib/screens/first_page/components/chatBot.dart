import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class chatBot extends StatefulWidget {
  const chatBot({Key key}) : super(key: key);

  @override
  _chatBotState createState() => _chatBotState();
}

class _chatBotState extends State<chatBot> {

  String recommendation = '';

  void getHttp() async {
    try {
      var response = await Dio().get('http://localhost:5000/');
      if(response.statusCode == 200) {
        print(response.data);
        setState(() {
          recommendation = response.data.toString();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      height: 160,
      width: 300,
      child: Text(recommendation, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
    );
  }
}
