import 'dart:math';

import 'package:flutter/material.dart';
class UniqueKeyPage extends StatefulWidget {
  //UniqueKeyPage(Key key) : super(key: key);

  @override
  _UniqueKeyPageState createState() => _UniqueKeyPageState();
}

class _UniqueKeyPageState extends State<UniqueKeyPage> {

  bool _switchValue = false;
  List<Widget> children;

  @override
  void initState() {
    super.initState();

    children = [
      ColorStateWidget(key:UniqueKey(), text: '1'),
      ColorStateWidget(key:UniqueKey(), text: '2'),
      // ColorStateWidget( text: '3'),
    ];
  }

  void swapTiles() => setState(() {
        final child = children.removeAt(0);
        children.insert(1, child);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unique Key Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
              value: _switchValue,
              onChanged: (v) {
                setState(() => _switchValue = v);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz, size: 32),
        onPressed: swapTiles,
      ),
    );
  }
}

class ColorStateWidget extends StatefulWidget {
  final String text;

  const ColorStateWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  ColorStateWidgetState createState() => ColorStateWidgetState();
}

class ColorStateWidgetState extends State<ColorStateWidget> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 90,
      height: 150,
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.red,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController searchController = TextEditingController();
//
//  final widgets = List.generate(
//    10000,
//    (index) => Container(
//      decoration: BoxDecoration(
//        border: Border(
//          bottom: BorderSide(
//            color: Colors.black,
//          ),
//        ),
//      ),
//      // height: 90.0,
//      //  color: Colors.primaries[index % Colors.primaries.length],
//      child: ListTile(
//        title: Text('Index: $index'),
//      ),
//    ),
//  );
//
//  final _scrollController = ScrollController();
//
//  void _onPressed() async {
//    _scrollController.jumpTo(
//      _scrollController.position.extentAfter,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('List Demo'),
//        centerTitle: true,
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _onPressed,
//        splashColor: Colors.red,
//        child: Icon(Icons.slow_motion_video),
//      ),
//      body: Container(
//        child: Column(
//          children: [
//            TextField(
//              decoration: InputDecoration(
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(10.0),
//                  ),
//                ),
//                prefixIcon: Icon(Icons.search),
//              ),
//            ),
//            Expanded(
//              child: ListView(
//                controller: _scrollController,
//                children: widgets,
//                itemExtent: 80,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

