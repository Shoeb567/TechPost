//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//
//class Services{
//
//  static const String url =('https://unpkg.com/country-flag-emoji-json@1.0.2/json/flag-emojis.pretty.json');
//
//  static Future<List<Posts>> getUsers() async{
//    try{
//      final response = await http.get(url);
//      if(200 == response.statusCode){
//        final List<Posts> users = (response.body);
//        return users;
//      }
//      else{
//        //return List<User>();
//        throw Exception('Can;t Find Data');
//      }
//    }
//    catch(e){
//      return List<Posts>();
//    }
//  }
//}
//
//class Posts {
//  int userId;
//  int id;
//  String title;
//  String body;
//
//  Posts({this.userId, this.id, this.title, this.body});
//
////  Posts.fromJson(Map<String, dynamic> json) {
////    userId = json['userId'];
////    id = json['id'];
////    title = json['title'];
////    body = json['body'];
////  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['userId'] = this.userId;
//    data['id'] = this.id;
//    data['title'] = this.title;
//    data['body'] = this.body;
//    return data;
//  }
//}