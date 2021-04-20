import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:tech_post_app/imagefile.dart';

class ShowApiData extends StatefulWidget {
  @override
  _ShowApiDataState createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  Future<List<User>> getUserData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");

    final jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var i in jsonData) {
      User user = User(i["userId"].toString(),i["name"].toString(), i["username"].toString(),i["body"].toString());
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder (
        future: getUserData(),
        builder: (context,  AsyncSnapshot<List<User>> snap) {
          if (snap.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder (
              itemCount: snap.data.length,
              itemBuilder: (BuildContext context, int index) {
                String oneChar = snap.data[index].name
                    .toString()
                    .substring(0, 1)
                    .toUpperCase();
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(183, 182, 185, 0.1),
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                oneChar,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        title: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 12,
                                  color: Color.fromRGBO(104, 118, 132, 1),
                                ),
                                Text(
                                  '  Twitter Home',
                                  style: TextStyle(fontSize: 10,
                                    color: Color.fromRGBO(104, 118, 132, 1),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  ' ${snap.data[index].name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.verified,
                                    size: 17, color: Colors.blue),
                                Text(
                                  '@',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(104, 118, 132, 1),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${snap.data[index].username} - 10h',
                                    style: TextStyle(fontSize: 14,
                                      color: Color.fromRGBO(104, 118, 132, 1),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 18,
                                  color: Color.fromRGBO(189, 197, 205, 1),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text('${snap.data[index].userId} \n ${snap.data[index].body}' ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 50,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      AppAssets.comment_icon,
                                      color: Color.fromRGBO(104, 118, 132, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      AppAssets.retweet_icon,
                                      color: Color.fromRGBO(104, 118, 132, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      AppAssets.heart_icon,
                                      color: Color.fromRGBO(104, 118, 132, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      AppAssets.share_icon,
                                      color: Color.fromRGBO(104, 118, 132, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class User {
  final String userId, name, username, body;

  User(this.userId, this.name, this.username, this.body);

//  factory User.fromJson(Map<String, dynamic> json) {
//    List<Post> tempUsers = [];
//    for (int i = 0; i < json['users'].length; i++) {
//      Post post = Post.fromJson(json['users'][i]);
//      tempUsers.add(post);
//    }
//    return User();
  //}
}
class Post {
  final String userId;
  final String id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'].toString(),
      body: json['body'].toString(),
    );
  }
}
//class Users {
//  final List<Post> users;
//
//  Users({this.users});
//
//  factory Users.fromJson(Map<String, dynamic> json) {
//    List<Post> tempUsers = [];
//    for (int i = 0; i < json['users'].length; i++) {
//      Post post = Post.fromJson(json['users'][i]);
//      tempUsers.add(post);
//    }
//    return Users(users: tempUsers);
//  }
//}