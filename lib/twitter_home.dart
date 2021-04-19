import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:tech_post_app/imagefile.dart";
import "dart:convert";

import "package:http/http.dart" as http;

import 'ApiFetchScreens/show_api_data.dart';

class TwiterHome extends StatefulWidget {
  @override
  _TwiterHomeState createState() => _TwiterHomeState();
}

class _TwiterHomeState extends State<TwiterHome> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black));
    // ignore: file_names
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("S", style: TextStyle(color: Colors.white))),
                  Image.asset(AppAssets.logo),
                  Image.asset(AppAssets.fatureicon),
                ])),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.markunread_outlined), label: ""),
          ],
        ),
        body: Container(
            child:ShowApiData()
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
