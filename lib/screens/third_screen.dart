import 'package:flutter/material.dart';


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

          ],
        ),
      ),
    );
  }
}
