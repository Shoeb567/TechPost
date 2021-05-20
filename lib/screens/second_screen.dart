import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/user_class_model.dart';

// ignore: must_be_immutable
class SecondScreen extends StatelessWidget {
// final String name,mobile;
//
//   SecondScreen({ this.name,  this.mobile});
  @override
  Widget build(BuildContext context) {
    final  user_model_data = ModalRoute.of(context).settings.arguments as User_Model;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Name ::${user_model_data.name}'),
            SizedBox(height: 20),
            Text('Mobile No ::${user_model_data.mobile}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
                  // Navigator.of(context).popAndPushNamed("/third");
                //   Navigator.of(context).pushReplacementNamed("/second");
                //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>FirstScreen()),ModalRoute.withName('/'));
              },
              child: Text('Go to Third Screen!\n(pushedNamed)'),
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
