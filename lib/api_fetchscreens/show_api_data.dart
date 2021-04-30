import 'package:flutter/cupertino.dart';
import 'package:tech_post_app/getAll_projectfile.dart';
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
  @override
  void initState() {
    super.initState();
    // fetchUsers(toString());
    // fetchPost();
  }
  @override
  Widget build(BuildContext context) {
   final viewModel = Provider.of<ApiServices>(context);
    return Container(
      color: Colors.white,
      child: Consumer<ApiServices>(
        builder: (context, snap,_) {
          if (snap.postWithUsernameList.isEmpty == null) {
            return Container(
              child: Center(
                child: CupertinoActivityIndicator(animating: true),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.postWithUsernameList.length,
              itemBuilder: (BuildContext context, index) {
                String oneChar =
                viewModel.postWithUsernameList[index].name.substring(0, 1).toUpperCase();
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
                                  ' ${viewModel.postWithUsernameList[index].name}',
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
                                    '${viewModel.postWithUsernameList[index].username} - 10h',
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
                                  child: Text('${viewModel.postWithUsernameList[index].body}'),
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
