import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class secondPageDesktop extends StatefulWidget {
  String feedback;
  String description;
  secondPageDesktop({this.feedback, this.description});

  @override
  _secondPageDesktopState createState() => _secondPageDesktopState();
}

class _secondPageDesktopState extends State<secondPageDesktop> {
  Size size;
  String userLocation;

  @override
  void initState() {
    super.initState();

    sendFeedback();
  }

  sendFeedback() async {
    try {
      var location = Uri.parse('http://ip-api.com/json');

      http.get(location).then((value) async {
        userLocation = json.decode(value.body)['country'].toString();
        try {
          /// ?contry=iran&feedback=feedback
          var response = await Dio().get(
              'http://localhost:5000/sendFeedback?country=' +
                  userLocation +
                  '&feedback=' +
                  widget.feedback);
          print(response.data);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.data}');
        } catch (e) {
          print(e);
        }
      });
    } catch (err) {
      //handleError
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You chose " + widget.feedback,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Thank you for your cooperation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.indigo,
                  alignment: Alignment.center,
                  child: Text(
                    "Try again",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('The data will be saved on the Database'),
            ],
          ),
        ),
      ),
    );
  }
}
