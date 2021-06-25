import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_post_app/mobx_implementation/mobx_mainpage.dart';
import 'package:tech_post_app/show_screen/twitter_home.dart';
import 'package:tech_post_app/theme_package/cutome_theme.dart';
import 'package:tech_post_app/theme_package/second_page_data.dart';

class Theme_Practice extends StatefulWidget {
  @override
  _Theme_PracticeState createState() => _Theme_PracticeState();
}

class _Theme_PracticeState extends State<Theme_Practice> {
  @override
  Widget build(BuildContext context) {
    final theme_model = Provider.of<CustomTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme_model.lightTheme,
      darkTheme: theme_model.darkTheme,
      themeMode: theme_model.currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Theme Screen',

            style: TextStyle(
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.brightness_4),
                onPressed: () {
                  // print('Theme Change');
                  theme_model.toggleTheme();
                },
            ),
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Consumer<CustomTheme>(
            builder: (context, snap, _) {
              print('Consumer');
              return IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Dark & White Theme',
                      //style:  Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    ElevatedButton(
                      child:  Text('Twitter HomePage'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TwiterHome(),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child:  Text('Take break'),
                      onPressed: () => setState(() {}),
                    ),
                    ElevatedButton(
                      child:  Text('Patrol'),
                      onPressed: () => setState(() {}),
                    ),
                    ElevatedButton(
                      child:  Text('Name Pass'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Second_Page_Theme(
                              name: 'Shoeb Shaikh',
                            ),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child:  Text('Mobex Demopage'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mobx_HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
              // }
            },
          ),
        ),
      ),
    );
  }
}

class CustomColors {
  static const Color lightPurple = const Color(0xFFCE93D8);
  static const Color purple = const Color(0xFF7C4DFF);
}
