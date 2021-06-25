import 'package:flutter/material.dart';
//import 'package:tech_post_app/screens/first_screen.dart';
import 'package:tech_post_app/screens/user_class_model.dart';

// ignore: must_be_immutable
class LogIn extends StatefulWidget {
   String logInObj ;
   LogIn({this.logInObj= "Please LogIn"});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  User_Model obj = User_Model();
  @override
  Widget build(BuildContext context) {
   // final  user_model_data = ModalRoute.of(context).settings.arguments as User_Model;
    print('Log In User');

    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn User'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
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
                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: TextFormField(
                  controller: password,
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
                    Navigator.of(context).pushReplacementNamed("/first",
                        arguments: User_Model(
                            name: name.text,
                            mobile: password.text,
                            loginVerify: 'LogIn SuccessFull'));
//                  Navigator.of(context).pushReplacement(
//                    MaterialPageRoute(
//                      builder: (context) => FirstScreen(),
//                    ),
//                  );
                   // Navigator.pushNamed(context, '/first',  arguments: FirstScreen(firstRouteName: 'LogIn SuccessFull'));
//                      Navigator.pushAndRemoveUntil(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => FirstScreen()),
//                          ModalRoute.withName('/first'));
                  },
                ),
              ),
//
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Status::${obj.loginStatus}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
