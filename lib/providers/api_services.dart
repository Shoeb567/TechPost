import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tech_post_app/class_model/post_model.dart';
import 'package:tech_post_app/class_model/postwithusername_model.dart';
import 'package:tech_post_app/class_model/user_model.dart';
import "package:http/http.dart" as http;
class ApiServices extends ChangeNotifier{
  List<PostWithUsername> postWithUsernameList = [];
  Provider_File(){
    getAllPostWithUserName();
  }
  Future<User> fetchUsers(String id) async {
    var response =
    await http.get('https://jsonplaceholder.typicode.com/users/$id');
    User user;
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      user = User.fromJson(jsonResponse);
      notifyListeners();
    } else {
      print('Can;t Find Data');
    }
    return user;
  }

  Future<List<Post>> fetchPost() async {
    print('Fetch Post');
    List<Post> posts = List<Post>();
    try {
      final response =
      await http.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        posts = Post.postFromJson(response.body);
        print('Post data:${posts.length}');
        notifyListeners();
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
      postWithUsernameList = listOfPostWithUserName.toList();
    }
    print('==>listOfPostWithUserName::${listOfPostWithUserName.length}');
    notifyListeners();
    return postWithUsernameList;
  }
}