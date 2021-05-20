import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondScreen extends StatelessWidget {
 final String name,mobile;

   SecondScreen({ this.name,  this.mobile});

  @override
  Widget build(BuildContext context) {
    final SecondScreen args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Name ::${args.name}'),
            SizedBox(height: 20),
            Text('Mobile No ::${args.mobile}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  // Navigator.of(context).popAndPushNamed("/third");
                //   Navigator.of(context).pushReplacementNamed("/second");
                Navigator.pushNamed(context, '/third');
                //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>FirstScreen()),ModalRoute.withName('/'));
              },
              child: Text('Go to Third Screen!'),
            ),
          ],
        ),
      ),
    );
  }
}
//
//class SecondScreenData {
//  final String name;
//  final String mobile;
//
//  SecondScreenData(this.name, this.mobile);
//}
