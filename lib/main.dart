import 'package:tech_post_app/getAll_projectfile.dart';
import 'package:tech_post_app/screens/first_screen.dart';
//import 'package:tech_post_app/screens/login_screen.dart';
import 'package:tech_post_app/screens/logout_screen.dart';
import 'package:tech_post_app/screens/second_screen.dart';
import 'package:tech_post_app/screens/third_screen.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';
import 'package:tech_post_app/theme_package/cutome_theme.dart';
import 'package:tech_post_app/theme_package/theme_homepage.dart';

import 'mobx_implementation/mobx_mainpage.dart';

//import 'package:tech_post_app/unique_key_example.dart';
//import 'package:tech_post_app/widget_file.dart';

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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

   // final theme_model = Provider.of<CustomTheme>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostListViewModel>(
          create: (BuildContext context) {
            print('Provider call');
            return PostListViewModel();
          },
        ),
        ChangeNotifierProvider<CustomTheme>(
          create: (BuildContext context) {
            print('Theme Provider call');
            return CustomTheme();
          },
        ),
      ],
//    return ChangeNotifierProvider<PostListViewModel>(
//      create: (BuildContext context) {
//        print('Provider call');
//        return PostListViewModel();
//      },

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //theme: theme_model.lightTheme,
        //darkTheme: theme_model.darkTheme,
       // themeMode: theme_model.currentTheme,
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {

        //  '/': (context) => Mobx_HomePage(),
        '/': (context) => Theme_Practice(),
          // '/': (context) => MyHomePageState(),
          '/showUser': (context) => ShowUserData(),
          //'/': (context) => LogIn(),
          '/first': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
          '/third': (context) => ThirdScreen(),
          '/logout': (context) => LogOut(),
          //'/editUserData' : (context) => EditUserData()
        },
        //home: LogIn()
      ),

    );
  }
}
//how to Check work build method
//what is keys
//how to optimize build method
//how to us const keywork in build method
//Keys::1) Globle key
//2) Value key , Object key , Unique key
