import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/first_screen.dart';
import 'package:tech_post_app/screens/second_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
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
                  'LogIn',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
//                  Navigator.of(context).pushReplacement(
//                    MaterialPageRoute(
//                      builder: (context) => FirstScreen(),
//                    ),
//                  );
                  // Navigator.pushNamed(context, '/first');
                    Navigator.of(context).pushReplacementNamed("/first");
//                      Navigator.pushAndRemoveUntil(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => FirstScreen()),
//                          ModalRoute.withName('/first'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
