import 'package:flutter/material.dart';
import 'package:tech_post_app/screens/login_screen.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
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
            Text(
              'LogOut User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
               // Navigator.pushNamedAndRemoveUntil(context, '/first',ModalRoute.withName('/third'));
                Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
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
