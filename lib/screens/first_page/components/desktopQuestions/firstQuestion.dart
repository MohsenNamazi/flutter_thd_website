import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thd_tfrs/model/fieldSelection.dart';
import 'package:http/http.dart' as http;



class first extends StatefulWidget {
  StreamController<int> streamController;
  bool skip;

  first({this.streamController, this.skip});

  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {

  double widthScreen;
  double heightScreen;

  String userLocation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  sendFeedback() async {
    try {
      var location= Uri.parse('http://ip-api.com/json');

      http.get(location).then((value) async {
        userLocation = json.decode(value.body)['country'].toString();
        try{
          /// ?contry=iran&feedback=feedback
          var response = await Dio().get('http://localhost:5000/sendFeedback?country='+userLocation+'&feedback=NewDesignSelection');
          print(response.data);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.data}');
        } catch(e){
          print(e);
        }
      });
    } catch (err) {
      //handleError
    }
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        runSpacing: 5.0,
        spacing: 50.0,
        direction: widget.skip? Axis.vertical : Axis.horizontal,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          tile(pic: 'masterAs.jpg', title: 'I am looking for the master', tag: 'master'),
          tile(pic: 'bachelorAs.jpg', title: 'I am looking for the bachelor', tag: 'bachelor'),
        ],
      ),
    );
  }

  Widget tile({String pic, String title, String tag}){
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          sendFeedback();
          userSelections.MsBr = tag;
          widget.streamController.add(1);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: Colors.red,
          child: Stack(
            children: [
              if(!widget.skip)
                Image(
                  height: widget.skip? heightScreen/10 : heightScreen*3/10,
                  width: widthScreen*3/10,
                  image: new AssetImage(
                      "pics/"+pic),
                  fit: BoxFit.cover,
                ),
              Container(
                height: widget.skip? heightScreen/10 : heightScreen*3/10,
                width: widget.skip? widthScreen*2/10 : widthScreen*3/10,

                alignment: Alignment.bottomCenter,
                child: Container(
                  height: heightScreen/10,
                  width: widget.skip? widthScreen*2/10 : widthScreen*3/10,
                  color: Colors.white.withOpacity(0.8),
                  alignment: Alignment.center,
                  child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
