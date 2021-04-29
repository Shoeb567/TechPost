import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:tech_post_app/imagefile.dart';

class ShowApiData extends StatefulWidget {
  final Future<User> users;

  ShowApiData({Key key, this.users}) : super(key: key);

  @override
  _ShowApiDataState createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  Future<User> fetchUsers(String id) async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/users/$id');
    User user;
    if (response.statusCode == 200) {
       final jsonResponse = json.decode(response.body);
        user = User.fromJson(jsonResponse);
    } else {
      print('Can;t Find Data');
    }
     return user;
  }

  Future<List<Post>> fetchPost() async {
    try {
      final response =
          await http.get('http://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final List<Post> posts = postFromJson(response.body);
        return posts;
      } else {
        throw Exception('Can;t Find Data');
      }
    } catch (e) {
      return List<Post>();
    }
  }
  Future<List<PostWithUsername>> getAllPostWithUserName() async {
    print('===');
    List<PostWithUsername> listOfPostWithUserName = [];
    final List<Post> listOfPosts = await fetchPost();
    for (final postList in listOfPosts) {
      User userName = await fetchUsers(postList.userId);
      print('==>List Start::${listOfPostWithUserName.length}');
      listOfPostWithUserName.add(
          PostWithUsername(userName.name, userName.username, postList.body));
    }
    print('==>listOfPostWithUserName::${listOfPostWithUserName.length}');
    return listOfPostWithUserName;
  }

  @override
  void initState() {
    super.initState();
    // fetchUsers(toString());
    // fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: getAllPostWithUserName(),
        builder: (context, AsyncSnapshot<List<PostWithUsername>> snap) {
          if (snap.data == null) {
            return Container(
              child: Center(
                child: CupertinoActivityIndicator(animating: true),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (BuildContext context, index) {
                //  PostWithUsername user = listOfPostWithUserName[index];
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
                                  style: TextStyle(
                                    fontSize: 10,
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
                                    style: TextStyle(
                                      fontSize: 14,
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
                                  child: Text('${snap.data[index].body}'),
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
  User({
    this.id,
    this.name,
    this.username,
  });

  String id;
  String name;
  String username;

  factory User.fromJson(dynamic json) {
    return User(
        id : json['id'].toString() ,
        name : json['name'] .toString(),
        username:json['username'] .toString());
  }
  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.username} }';
  }
}

//List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
List<Post> postFromJson(String str) {
  final jsonData = json.decode(str);
  return  List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}
//String postToJson(List<Post> data) =>
//    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post {

  String id;
  String userId;
  String body;
  Post({
    this.id,
    this.userId,
    this.body,
  });


  factory Post.fromJson(Map<String,dynamic> json) {
    return Post(
        id : json['id'].toString() ,
        userId : json['userId'] .toString(),
        body:json['body'] .toString());
  }
  @override
  String toString() {
    return '{ ${this.id}, ${this.userId}, ${this.body} }';
  }
//  factory Post.fromJson(Map<String, dynamic> json) => Post(
//        id: json["id"].toString(),
//        userId: json["userId"].toString(),
//        body: json["body"].toString(),);


//  Map<String, dynamic> toJson() => {
//        "id": id,
//        "userId": userId,
//        "body": body,
//      };
}

class PostWithUsername {
  final String name;
  final String username;
  final String body;

  PostWithUsername(this.name, this.username, this.body);
}
