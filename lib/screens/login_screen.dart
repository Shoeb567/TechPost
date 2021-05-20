import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/first_screen.dart';


// ignore: must_be_immutable
class LogIn extends StatefulWidget {
  String logInObj = "Please LogIn";
  LogIn({this.logInObj});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //String data = "Please LogIn";
  @override
  Widget build(BuildContext context) {
   // final LogIn args = ModalRoute.of(context).settings.arguments;
    print('Log In User');
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn User'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'LogIn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Password'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: ElevatedButton(
                child: Text(
                  'LogIn\n(pushReplacementNamed)',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/first",arguments: FirstScreen(firstRouteName: 'LogIn SuccessFull'));
//                  Navigator.of(context).pushReplacement(
//                    MaterialPageRoute(
//                      builder: (context) => FirstScreen(),
//                    ),
//                  );
                  // Navigator.pushNamed(context, '/first');
//                      Navigator.pushAndRemoveUntil(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => FirstScreen()),
//                          ModalRoute.withName('/first'));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Status::',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
