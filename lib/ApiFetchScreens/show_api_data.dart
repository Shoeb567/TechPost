import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:tech_post_app/imagefile.dart';

class ShowApiData extends StatefulWidget {
  @override
  _ShowApiDataState createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  Future getUserData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/users");
    final jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var i in jsonData) {
      User user = User(i["name"].toString(), i["username"].toString());
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: getUserData(),
        builder: (context, snap) {
          if (snap.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snap.data.toString().length,
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
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  oneChar,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        size: 12,
                                        color: Color.fromRGBO(104, 118, 132, 1),
                                      ),
                                      Text(
                                        '  Twitter Home',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${snap.data[index].name.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.verified,
                                          size: 17, color: Colors.blue),
                                      Text('@', style: TextStyle(fontSize: 15)),
                                      Expanded(
                                        child: Text(
                                          '${snap.data[index].username.toString()} - 10h',
                                          style: TextStyle(fontSize: 14),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            'TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            AppAssets.comment_icon,
                                            color: Color.fromRGBO(
                                                104, 118, 132, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            AppAssets.retweet_icon,
                                            color: Color.fromRGBO(
                                                104, 118, 132, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            AppAssets.heart_icon,
                                            color: Color.fromRGBO(
                                                104, 118, 132, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Image.asset(
                                            AppAssets.share_icon,
                                            color: Color.fromRGBO(
                                                104, 118, 132, 1),
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
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class User {
  final String name, username;

  User(this.name, this.username);
}
