import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/second_screen.dart';

// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  String firstRouteName;
//   String name='Shoeb Shaikh';
//   String mobile='7990508505';
  FirstScreen({this.firstRouteName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Go To Second Screen"),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/second",
                    arguments: SecondScreen(name: 'Aamir',mobile: '7990505825'),
                      result: SecondScreen(name: 'Aamir',mobile: '7990505825',));
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Data is::${firstRouteName}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('OnTapSecond');
//            Navigator.of(context)
//                .popUntil(ModalRoute.withName("/second"));
              //  Navigator.of(context).pushReplacementNamed("/second");
                // Navigator.of(context).popAndPushNamed("/second");
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SecondScreen()),ModalRoute.withName('/second'));
                 Navigator.pushNamed(context, '/second',arguments: SecondScreen(name:'Shoeb',mobile:'1234567890'));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));
              },
              child: Text('Go to Second screen'),
            ),
          ],
        ),
      ),
    );
  }
}
