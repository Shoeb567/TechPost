

import 'package:tech_post_app/getAll_projectfile.dart';

import 'package:tech_post_app/screens/first_screen.dart';
import 'package:tech_post_app/screens/login_screen.dart';
import 'package:tech_post_app/screens/logout_screen.dart';
import 'package:tech_post_app/screens/second_screen.dart';
import 'package:tech_post_app/screens/third_screen.dart';

import 'package:tech_post_app/show_screen/edit_user_data.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';
import 'package:tech_post_app/show_screen/twitter_home.dart';
//
void main() {
  runApp(MyApp());
}
//void main() {
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Named Routes Demo',
//      initialRoute: '/',
//      routes: {
//        '/': (context) => FirstScreen(),
//        '/second': (context) => SecondScreen(),
//        '/third': (context) => ThirdScreen(),
//        '/twitterHome': (context) => TwitterApp(),
//        '/showUserData' : (context) => ShowUserData(),
//        //'/editUserData' : (context) => EditUserData()
//      },
//
//  )
//  );
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => LogIn(),
          '/first': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
          '/third': (context) => ThirdScreen(),
          '/logout': (context) => LogOut(),
          //'/editUserData' : (context) => EditUserData()
        },
         //home: LogIn()
    );
  }
}
