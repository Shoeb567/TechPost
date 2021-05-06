import 'dart:convert';
import 'package:tech_post_app/getAll_projectfile.dart';
import "package:http/http.dart" as http;

class ApiServices extends ChangeNotifier {
  List<PostWithUsername> postWithUsernameList = [];

  ApiServices() {
    getAllPostWithUserName();
    //  likeMethod(false);
  }

  Future<User> getUsersData(String id) async {
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

  Future<List<Post>> getPostData() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return Post.postFromJson(response.body);
    } else {
      throw Exception('Can;t Find Data');
    }
  }
  onLikeButtonTapped(int index) {
    if(postWithUsernameList[index].isLiked == false){
      print('Like Index No:${ postWithUsernameList[index].indexId }');
      postWithUsernameList[index].isLiked = true;
    }
    else{
      print('DisLike Index No:${ postWithUsernameList[index].indexId }');
      postWithUsernameList[index].isLiked = false;
    }
    notifyListeners();
  }

  Future<List<PostWithUsername>> getAllPostWithUserName() async {
    print('===');
    List<PostWithUsername> listOfPostWithUserName = [];
    final List<Post> listOfPosts = await getPostData();
    for (final postList in listOfPosts) {
      User userName = await getUsersData(postList.userId);
      print('==>Length Start::${postWithUsernameList.length}');
      listOfPostWithUserName.add(PostWithUsername(
          userName.name, userName.username, postList.body,postList.id, false));
      postWithUsernameList = listOfPostWithUserName.toList();
      notifyListeners();
    }
    print('==>listOfPostWithUserName::${postWithUsernameList.length}');
    return postWithUsernameList;
  }
}
