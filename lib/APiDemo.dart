//import 'dart:convert';
//
//import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  Map<String, dynamic> post;
//  List<dynamic> comments=[];
//
//  bool _showLoading = true;
//  bool _showComments = true;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _fetchData();
//  }
//
//  Future<String> _futureError() async {
//  //  throw new Exception('my error');
//    return 'result';
//  }
//
//  Future _fetchData() async {
//    setState(() { _showLoading = true; });
//
//    final results = await Future.wait([
//      http.get('http://jsonplaceholder.typicode.com/posts/1'),
//      http.get('http://jsonplaceholder.typicode.com/users?userId=1'),
//
//      _futureError().catchError((e) {
//        return 'error';
//      }),
//    ]);
//
//    print(results[0]);
//    print(results[1]);
//
////
////     setState(() {
////       post = json.decode(results[0].toString());
////       comments = json.decode(results[1].toString());
////
////     });
//     setState(() {
//       _showLoading = false;
//     });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return CupertinoPageScaffold(
//      navigationBar: CupertinoNavigationBar(
//        middle: Text("JSON Placeholder Blog post"),
//      ),
//      child: SingleChildScrollView(
//        child: Padding(
//          padding: EdgeInsets.all(12.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Container(height: 70),
//              if (_showLoading)
//                Center(child: CupertinoActivityIndicator(animating: true)),
//
//              if (!_showLoading) ... [
//                Text(post['title'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//
//                SizedBox(height: 10),
//
//                _showCommentsToggle(),
//
//                SizedBox(height: 10),
//
//                if (!_showComments)
//                  Text(post['body'].toString(), style: TextStyle(fontSize: 14)),
//
//                if (_showComments)
//                  ..._commentList()
//              ]
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  _showCommentsToggle() {
//    return Row(
//      children: [
//        Text('Show comments', style: TextStyle(fontWeight: FontWeight.bold),),
//        GestureDetector(
//          child: CupertinoSwitch(
//            value: _showComments,
//            onChanged: (bool value) { setState(() { _showComments = value; }); },
//          ),
//          onTap: () { setState(() { _showComments = !_showComments; }); },
//        ),
//      ],
//    );
//  }
//
//  _commentList() {
//    return comments.map((comment) => Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        Text(comment['email'].toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
//        Text(comment['body'].toString(),  style: TextStyle(fontSize: 14)),
//        SizedBox(height: 15)
//      ],
//    )).toList();
//  }
//}