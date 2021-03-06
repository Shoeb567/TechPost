import 'package:tech_post_app/getAll_projectfile.dart';

import 'package:tech_post_app/show_screen/show_user_data.dart';

class TwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostListViewModel>(
      create: (BuildContext context) {
        print('Provider call');
        return PostListViewModel();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TwiterHome(),
      ),
    );
  }
}

class TwiterHome extends StatefulWidget {
  @override
  _TwiterHomeState createState() => _TwiterHomeState();
}

class _TwiterHomeState extends State<TwiterHome> {
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<PostListViewModel>(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "S",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Image.asset(AppAssets.logo),
            Image.asset(AppAssets.fatureicon),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Consumer<PostListViewModel>(
          builder: (context, snap, _) {
            if (snap.postWithUsernameList.isEmpty) {
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
                                      child: Text(
                                        oneChar,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {
                                      print('On Tap');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShowUserData(
                                            userIndex: _model.onTappedUsersData(
                                                _model.postWithUsernameList[
                                                    index]),
                                          ),
                                        ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                        color: Color.fromRGBO(104, 118, 132, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Image.asset(
                                        AppAssets.retweet_icon,
                                        color: Color.fromRGBO(104, 118, 132, 1),
                                      ),
                                    ),
                                  ),
//                                  Container(
//                                    width: 50,
//                                    child: IconButton(
//                                      onPressed: () {
//                                        _model.onLikeButtonTapped(index);
//                                      },
//                                      icon: Icon(
//                                        _model.postWithUsernameList[index]
//                                            .isLiked
//                                            ? Icons.favorite
//                                            : Icons.favorite_border,
//                                        color: _model
//                                            .postWithUsernameList[index]
//                                            .isLiked
//                                            ? Colors.red
//                                            : Colors.grey,
//                                        size: 20,
//                                      ),
//                                    ),
//                                  ),
                                  Container(
                                    width: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        _model.onLikeButtonTapped(index);
                                      },
                                      child: Image.asset(
                                        _model.postWithUsernameList[index]
                                                .isLiked
                                            ? AppAssets.fill_heart_icon
                                            : AppAssets.heart_icon,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        _model.onLikeButtonTapped(index);
                                      },
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.markunread_outlined), label: ""),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: () {},
        child: Image.asset(AppAssets.texticon),
      ),
    );
  }
}
