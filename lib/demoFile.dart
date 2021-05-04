//import 'package:flutter/material.dart';
//
//void main() => runApp(new MyApp1());
//
//class MyApp1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'ListView Like - Unlike'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  List<Item> _itemList;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _itemList = List<Item>();
//    for (int i = 0; i < 10; i++) {
//
//      _itemList.add(Item(
//        title: 'Item $i',
//        isFavorite: false,
//      ));
//     // print(_itemList.length);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text(widget.title),
//        ),
//        body: new ListView.builder(
//          itemCount: _itemList.length,
//          itemBuilder: (context, index) {
//            return ListItem(
//              _itemList[index],
//                  () => onFavoritePressed(index),
//            );
//          },
//        ));
//  }
//
//  onFavoritePressed(int index) {
//    final item = _itemList[index];
//   // print(item);
//    setState(() {
//      item.isFavorite = !item.isFavorite;
//    });
//    //print(item);
//  }
//}
//
//class ListItem extends StatelessWidget {
//  ListItem(this.item, this.onFavoritePressed);
//
//  final Item item;
//  final VoidCallback onFavoritePressed;
//
//  @override
//  Widget build(BuildContext context) {
//    return new GestureDetector(
//        onTap: (() {onFavoritePressed();}),
//        child: ListTile(
//            title: Text(item.title),
//            leading: IconButton(
//              icon: Icon(
//                  item.isFavorite ? Icons.favorite : Icons.favorite_border),
//            )));
//  }
//}
//
//class Item {
//  Item({this.title, this.isFavorite});
//
//  String title;
//  bool isFavorite;
//}