import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_post_app/theme_package/theme_homepage.dart';


class CustomTheme extends ChangeNotifier {
   ThemeData get lightTheme {
    return ThemeData(

      primaryColor: CustomColors.purple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColors.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }

   ThemeData get lightThemeNew {
     return ThemeData(

       primaryColor: CustomColors.purple,
       scaffoldBackgroundColor: Colors.lightGreenAccent,
       fontFamily: 'Montserrat',
       elevatedButtonTheme: ElevatedButtonThemeData(
         style: ElevatedButton.styleFrom(
           primary: CustomColors.lightPurple,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(18.0),
           ),
         ),
       ),
     );
   }


   ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomColors.purple,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,

    //  textTheme: ThemeData.dark().textTheme,
//      textTheme: TextTheme(
//        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
//      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColors.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }

   bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
  //  print('Method call');
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
