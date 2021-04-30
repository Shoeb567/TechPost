
import 'dart:convert';

class Post{
   List<Post> mainList = [];
  String id;
  String userId;
  String body;
  Post({
    this.id,
    this.userId,
    this.body,
    fetchPost()
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
  static List<Post> postFromJson(String str) {
    final jsonData = json.decode(str);
    return (jsonData as List<dynamic>).map((e) =>
        Post.fromJson(e as Map<String, dynamic>)).toList();
  }
}
