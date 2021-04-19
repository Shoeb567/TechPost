import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class ShowApiData extends StatefulWidget {
  @override
  _ShowApiDataState createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  Future getUserData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");

    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var i in jsonData) {
      User user = User(i["name"], i["email"], i["username"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snap) {
            if (snap.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),),);
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snap.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String oneChar =
                            snap.data[index].name.substring(0, 1).toUpperCase();
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Text(oneChar,style: TextStyle(color: Colors.white))),
                              title: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.favorite, size: 12, color: Colors.grey),
                                          Text('Twitter Home', style: TextStyle(fontSize: 10),)],),],),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text('${snap.data[index].name}', style: TextStyle(fontWeight: FontWeight.bold),),
                                      Icon(Icons.verified, size: 17, color: Colors.blue),
                                      Text('@', style: TextStyle(fontSize: 15)),
                                      Expanded(child: Text('${snap.data[index].username} - 10h', style: TextStyle(fontSize: 14)),),],),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text('TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost TechPost')),],),
                                  SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(icon:Icon(Icons.comment_rounded, size: 25, color: Colors.grey),onPressed: (){},),
                                      IconButton(icon:Icon(Icons.share, size: 25, color: Colors.grey),onPressed: (){}),
                                      IconButton(icon:Icon(Icons.favorite_border, size: 25, color: Colors.grey),onPressed: (){}),
                                      IconButton(icon:Icon(Icons.archive_outlined, size: 25, color: Colors.grey),onPressed: (){}),],),
                                  SizedBox(height: 10),],),),],);}))]);
            }})));
  }
}
class User {
  // ignore: type_annotate_public_apis
  final name, email, username;
  User(this.name, this.email, this.username);
}
