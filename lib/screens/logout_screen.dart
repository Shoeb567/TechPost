import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/login_screen.dart';

// ignore: must_be_immutable
class LogOut extends StatelessWidget {
  String logOutVar;
  LogOut({logOutVar});
//  @override
//  _LogOutState createState() => _LogOutState();
//}
//
//class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    print('Log Out User');
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout User'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/second'));

              },
              child: Text('Show Second Screen!\n    (PopUntil)'),
            ),
            SizedBox(height: 20),
            Text(
              'LogOut User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Logout\n    (pushNamedAndRemoveUntil)',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
               // Navigator.pushNamedAndRemoveUntil(context, '/first',ModalRoute.withName('/third'));
                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,arguments: LogIn(logInObj: 'LogOut'));
               // Navigator.of(context).pushReplacementNamed("/");
//                Navigator.pushAndRemoveUntil(
//                  context,
//                  MaterialPageRoute(builder: (context) => LogIn()),
//                  ModalRoute.withName('/'),
//                );
               },
            ),
          ],
        ),
      ),
    );
  }
}
