import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tech_post_app/switch_file.dart';
import 'package:tech_post_app/unique_key_example.dart';
//import 'package:tech_post_app/value_key_example.dart';

class MyHomePageState extends StatefulWidget {
  MyHomePageState({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
//MyHomePageState(key) : super(key: key);
}

class _MyHomePageState extends State<MyHomePageState> {
  //final _key = GlobalKey();
 // Color _currentColor = (Colors.blue);

 // Random _random = new Random();
  final _colorNotifier = MyColorNotifier();
 // final _colorValueNotifier = ValueNotifier<Color>(Colors.grey);

  void _onPressed() {
    _colorNotifier.changeColor();

//    int randomNumber = _random.nextInt(30);
//    _colorValueNotifier.value =
//        Colors.primaries[randomNumber % Colors.primaries.length];
  }

  int count = 0;

  void _onPressedText() {
    setState(() {
      count++;
    });
//    _currentColor.value =
//    Colors.primaries[randomNumber % Colors.primaries.length];
  }

  bool isActive = false;

  @override
  void dispose() {
    print('Call dispose method');
    _colorNotifier.dispose();
    super.dispose();
  }

  changeState() {
    isActive = !isActive;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('building `MyHomePage`');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(Icons.colorize),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: const BackgroundWidget(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                Center(
//                  child: ValueListenableBuilder(
//                    valueListenable: _colorValueNotifier,
//                    builder: (context,Color value, child) {
//                      print('ValueNotifier');
//                     return Container(
//                        height: 150,
//                        width: 150,
//                        color: value,
//                      );
//                    }
//                  ),
//                ),

                Container(
                  padding: EdgeInsets.all(150),
                  child: Center(
                    child: AnimatedBuilder(
                        animation: _colorNotifier,
                        builder: (_, __) {
                          //     print('Color Widget');
                          return Container(
                            height: 150,
                            width: 190,
                            color: _colorNotifier.myColor,
                          );
                        }),
                  ),
                ),
                Switch(
                    value: isActive,
                    activeColor: Colors.blueAccent,
                    onChanged: (bool currentStatus) {
                      isActive = currentStatus;
                      setState(() {});
                    },
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: Text('Count press'),
                    onPressed: _onPressedText,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(120),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(150),
                  child: const TextWidget(),
                ),
                Container(
                  //padding: EdgeInsets.only(bottom: 100),
                  child: ElevatedButton(
                    child: Text('Value Key Example'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  //padding: EdgeInsets.only(bottom: 100),
                  child: ElevatedButton(
                    child: Text('Unique Key Example'),
                    onPressed: () {
                      print('Unique key');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UniqueKeyPage(),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget();

  @override
  Widget build(BuildContext context) {
    print('building `BackgroundWidget`');
    return Image.network(
      'https://www.freecodecamp.org/news/content/images/2020/04/w-qjCHPZbeXCQ-unsplash.jpg',
      fit: BoxFit.cover,
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget();

  @override
  Widget build(BuildContext context) {
    print('building `TextWidget`');
    return Text(
      'Shoeb Shaikh',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

class MyColorNotifier extends ChangeNotifier {
  Color myColor = Colors.blue;
  Random _random = new Random();

  void changeColor() {
    print('Color Notifier');
    int randomNumber = _random.nextInt(30);
    myColor = Colors.primaries[randomNumber % Colors.primaries.length];
    notifyListeners();
  }
}
