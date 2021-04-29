//import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//void main() => runApp(MyAppDemo1());
//
//class MyAppDemo1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//          body: Center(
//              child: JSONListView()
//          ),
//        ));
//  }
//}
//
//class GetUsers {
//  String id;
//  String name;
//  String email;
//  String phoneNumber;
//
//  GetUsers({
//    this.id,
//    this.name,
//    this.email,
//    this.phoneNumber
//  });
//
//  factory GetUsers.fromJson(Map<String, dynamic> json) {
//    return GetUsers(
//        id: json['id'].toString(),
//        name: json['name'].toString(),
//        email: json['email'].toString(),
//        phoneNumber: json['phone'].toString()
//    );
//  }
//}
//
//class JSONListView extends StatefulWidget {
//  CustomJSONListView createState() => CustomJSONListView();
//}
//
//class CustomJSONListView extends State {
//
//  final String apiURL = 'https://jsonplaceholder.typicode.com/users';
//
//  Future<List<GetUsers>> fetchJSONData() async {
//
//    var jsonResponse = await http.get(apiURL);
//
//    if (jsonResponse.statusCode == 200) {
//
//      final jsonItems = json.decode(jsonResponse.body);
//
//      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
//        return GetUsers.fromJson(json);
//      }).toList();
//
//      return usersList;
//
//    } else {
//      throw Exception('Failed to load data from internet');
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('JSON ListView in Flutter'),
//      ),
//      body: FutureBuilder<List<GetUsers>>(
//        future: fetchJSONData(),
//        builder: (context, snapshot) {
//
//          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
//
//          return ListView(
//            children: snapshot.data
//                .map((user) => ListTile(
//              title: Text(user.name),
//              onTap: (){ print(user.name); },
//              subtitle: Text(user.phoneNumber),
//              leading: CircleAvatar(
//                backgroundColor: Colors.green,
//                child: Text(user.name[0],
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20.0,
//                    )),
//              ),
//            ),
//            )
//                .toList(),
//          );
//        },
//      ),
//    );
//  }
//}
//
//factory Post.fromJson(Map<String,dynamic json) {
//return Post(
//id : json['id'].toString() ,
//userId : json['userId'] .toString(),
//body:json['body'] .toString());
//}
//@override
//String toString() {
//  return '{ ${this.id}, ${this.userId}, ${this.body} }';
//}