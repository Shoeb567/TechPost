import 'dart:convert';
import 'package:tech_post_app/class_model/likeModel.dart';
import 'package:tech_post_app/getAll_projectfile.dart';
import "package:http/http.dart" as http;
class ApiServices extends ChangeNotifier{


  List<PostWithUsername> postWithUsernameList = [];

  List<LikeDataModel> likeTweet = [];

  ApiServices(){
    getAllPostWithUserName();
   // likeTweet.clear();
  }
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
    print('Fetch Post');
      final response =
      await http.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        return Post.postFromJson(response.body);
      } else {
        throw Exception('Can;t Find Data');
      }
  }
  Future<LikeDataModel> fetchLike() async {
   // print('Fetch Like');
    likeTweet.clear();
    likeTweet = List<LikeDataModel>();
    for (int i = 0; i < postWithUsernameList.length; i++) {
      likeTweet.add(LikeDataModel(
        likeTweets: false
      ));
    }
    print(likeTweet.length);
   return LikeDataModel(likeTweets: false);

  }

  Future<List<PostWithUsername>> getAllPostWithUserName() async {
    print('===');
    List<PostWithUsername> listOfPostWithUserName = [];
    final List<Post> listOfPosts = await fetchPost();
    for (final postList in listOfPosts) {
      User userName = await fetchUsers(postList.userId);
      LikeDataModel likeTweetedata = await fetchLike();
      listOfPostWithUserName.add(
          PostWithUsername(userName.name, userName.username, postList.body,likeTweetedata.likeTweets));
      postWithUsernameList = listOfPostWithUserName.toList();
        notifyListeners();
      }
    print('==>listOfPostWithUserName::${postWithUsernameList.length}');
    return postWithUsernameList;
  }
}