import 'package:flutter/cupertino.dart';
import 'package:tech_post_app/getAll_projectfile.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';

//import 'package:like_button/like_button.dart';
class TwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiServices>(
      create: (BuildContext context) {
        print('Provider call');
        return ApiServices();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShowApiData(),
      ),
    );
  }
}

class ShowApiData extends StatefulWidget {
  @override
  _ShowApiDataState createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
//  @override
//  void initState() {
//    super.initState();
//    // fetchUsers(toString());
//    // fetchPost();
//  }
  int indexId;

  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<ApiServices>(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.3,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("S", style: TextStyle(color: Colors.white))),
                  Image.asset(AppAssets.logo),
                  Image.asset(AppAssets.fatureicon),
                ])),
        body: Container(
          color: Colors.white,
          child: Consumer<ApiServices>(
            builder: (context, snap, _) {
              if (snap.postWithUsernameList.isEmpty ) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: _model.postWithUsernameList.length,
                  itemBuilder: (BuildContext context, index) {
                    String oneChar = _model.postWithUsernameList[index].name
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
                                ClipOval(
                                  child: Material(
                                    color: Colors.black, // button color
                                    child: InkWell(
                                      splashColor: Colors.red,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: Text(oneChar,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        //radius: 70.0,
                                      ),
                                      onTap: () {
                                        print('On Tap');
                                        //   _model.showUsersData(index);
                                        _model.showUsers(
                                          _model
                                              .postWithUsernameList[index].name,
                                          _model.postWithUsernameList[index]
                                              .username,
                                          _model.postWithUsernameList[index]
                                              .phone,
                                          _model
                                              .postWithUsernameList[index].lat,
                                          _model
                                              .postWithUsernameList[index].lng,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => UserData()),
                                        );
                                      },
                                    ),
                                  ),
                                )

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
                                      ' ${_model.postWithUsernameList[index].name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                        '${_model.postWithUsernameList[index].username} - 10h',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(104, 118, 132, 1),
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
                                      child: Text(
                                          '${_model.postWithUsernameList[index].body}'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  //    messageEmpty
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                          AppAssets.comment_icon,
                                          color:
                                              Color.fromRGBO(104, 118, 132, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                          AppAssets.retweet_icon,
                                          color:
                                              Color.fromRGBO(104, 118, 132, 1),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          _model.onLikeButtonTapped(index);
                                        },
                                        icon: Icon(
                                          _model.postWithUsernameList[index]
                                                  .isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: _model
                                                  .postWithUsernameList[index]
                                                  .isLiked
                                              ? Colors.red
                                              : Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
//                                    Container(
//
//                                      width: 50,
//                                      child: FlatButton(
//                                        onPressed: () {
//                                          _model.onLikeButtonTapped(index);
//                                        },
//                                        child: Image.asset(
//                                          AppAssets.heart_icon,
//                                          color:
//                                          Color.fromRGBO(104, 118, 132, 1),
////                                          _model.postWithUsernameList[index]
////                                              .isLiked ?
////                                         AppAssets.fill_heart_icon :AppAssets.heart_icon ,
////                                          color:
////                                          _model
////                                              .postWithUsernameList[index]
////                                              .isLiked
////                                              ? Colors.red
////                                              : Colors.grey,
//                                        ),
//                                      ),
//                                    ),
                                    Container(
                                      width: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          _model.onLikeButtonTapped(index);
                                        },
                                        child: Image.asset(
                                          AppAssets.share_icon,
//                                          _model.postWithUsernameList[index]
//                                              .isLiked? AppAssets.share_icon :  AppAssets.share_icon,
                                          color:
                                              Color.fromRGBO(104, 118, 132, 1),
//                                          _model
//                                              .postWithUsernameList[index]
//                                              .isLiked
//                                              ? Colors.red
//                                              : Colors.grey,
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
        ));
  }
}
