import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/user_class_model.dart';
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/logout");
                //   Navigator.popUntil(context, ModalRoute.withName('/first'));
                // Navigator.of(context).pushReplacementNamed("/logout");
//            Navigator.pushAndRemoveUntil(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => FirstScreen(
//                          firstRouteName: 'This is Passing data on First Route',
//                        )),
//                ModalRoute.withName('/logout'));
                // Navigator.pop(context);
                // Navigate back to first screen when tapped.
              },
              child: Text('Go to Logout Screen!\n    (PushNamed)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second',arguments: User_Model(name: 'Jay Pithva',mobile: '9898989898'));
              },
              child: Text('Go to Second Screen!\nUpdate Data\n(pushedNamed)'),
            ),

          ],
        ),
      ),
    );
  }
}
