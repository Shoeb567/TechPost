import "package:flutter/material.dart";
import 'package:tech_post_app/ApiFetchScreens/twitter_home.dart';
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
