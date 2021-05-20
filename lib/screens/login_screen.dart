import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/first_screen.dart';
import 'package:tech_post_app/screens/user_class_model.dart';
// ignore: must_be_immutable
class LogIn extends StatefulWidget {
//  String logInObj = "Please LogIn";
//  LogIn({this.logInObj});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //String data = "Please LogIn";
  @override
  Widget build(BuildContext context) {
    final  args = ModalRoute.of(context).settings.arguments as User_Model;
    var obj = User_Model(loginStatus:'Shoeb');
   // print(args.loginStatus);
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
                  Navigator.of(context).pushReplacementNamed("/first",arguments: User_Model(loginVerify: 'LogIn SuccessFull'));
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
//
//            Padding(
//              padding: const EdgeInsets.only(top: 40),
//              child: Text(
//                'Status::${args.loginStatus}',
//                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
