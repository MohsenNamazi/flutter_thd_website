import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/first_page/index.dart';
import 'package:thd_tfrs/translations.dart';

Future<void> main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Saira',
        primarySwatch: Colors.blue,
      ),
      supportedLocales: allTranslations.supportedLocales(),
      home: responsive(),
    );
  }
}

class responsive extends StatefulWidget {
  const responsive({Key key}) : super(key: key);

  @override
  _responsiveState createState() => _responsiveState();
}

class _responsiveState extends State<responsive> {
  bool lanIsLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupLan();
  }

  setupLan() async {
    lanIsLoaded = await allTranslations.init('en');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
 /*   if (MediaQuery.of(context).size.width <= 750 && lanIsLoaded)
      return Container(
        color: Colors.red,
      );

    if (MediaQuery.of(context).size.width > 750 &&
        MediaQuery.of(context).size.width < 1400 &&
        lanIsLoaded)
      return firstPageTablet();*/

    if (lanIsLoaded)
      return firstPageDesktop();
    return Container();
  }
}
