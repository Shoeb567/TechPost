import "package:flutter/material.dart";

//import 'package:tech_post_app/ApiFetchScreens/show_api_data.dart';
import "package:tech_post_app/twitter_home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TwiterHome(),
    );
  }
}
