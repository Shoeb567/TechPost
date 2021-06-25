import 'package:flutter/material.dart';
class BasicKeyPage extends StatefulWidget {
  @override
  _BasicKeyPageState createState() => _BasicKeyPageState();
}

class _BasicKeyPageState extends State<BasicKeyPage> {
  bool showEmail = true;
 // ValueNotifier<int> num = ValueNotifier();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Value Key Example'),
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Utils.heightBetween(
            [
              if (showEmail)
                TextField(
                 key: ValueKey(1),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              TextField(
                key: ValueKey(2),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ],
            height: 30
          ),
        ),
      ),
    ),
    floatingActionButton: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      icon: Icon(Icons.visibility_off),
      label: Text('Remove Email'),
      onPressed: () => setState(() => showEmail = false),
    ),
  );
}

//class MyObject {
//  final int number;
//
//  const MyObject(this.number);
//
//  @override
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//          other is MyObject &&
//              runtimeType == other.runtimeType &&
//              number == other.number;
//
//  @override
//  int get hashCode => number.hashCode;
//}

class Utils {
  static List<Widget> heightBetween(
      List<Widget> children, {
        @required double height,
      }) {
    if (children.isEmpty) return <Widget>[];
    if (children.length == 1) return children;

    final list = [children.first, SizedBox(height: height)];
    for (int i = 1; i < children.length - 1; i++) {
      final child = children[i];
      list.add(child);
      list.add(SizedBox(height: height));
    }
    list.add(children.last);

    return list;
  }
}