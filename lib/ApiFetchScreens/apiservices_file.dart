//import "dart:convert";
//
//List<Posts> userFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));
//
//String userToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//class Posts {
//  int userId;
//  int id;
//  String title;
//  String body;
//
//  Posts({this.userId, this.id, this.title, this.body});
//
//  Posts.fromJson(Map<String, dynamic> json) {
//    userId = json["userId"];
//    id = json['id'];
//    title = json['title'];
//    body = json['body'];
//  }
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
//
