//import 'package:flutter/material.dart';
//import 'package:tech_post_app/show_screen/edit_user_data.dart';
//
//import '../getAll_projectfile.dart';
//
//class UserData extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<ApiServices>(
//      create: (BuildContext context) {
//        print('Provider call');
//        return ApiServices();
//      },
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: ShowUserData(),
//      ),
//    );
//  }
//}
//class ShowUserData extends StatefulWidget {
//
//  @override
//  _ShowUserDataState createState() => _ShowUserDataState();
//}
//
//class _ShowUserDataState extends State<ShowUserData> {
//
//  @override
//  Widget build(BuildContext context) {
//    // print('User Details');
//    final _model = Provider.of<ApiServices>(context);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('User Details'),
//        centerTitle: true,
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.edit),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => EditUserData()),
//
//
//                );
//              }),
//        ],
//      ),
//      body: Container(
//          padding: EdgeInsets.all(10),
//          child: FutureBuilder(
//
//            //future:_model.name,
//              builder: (context, index) {
//                //var user = _model.showUsersData(index);
//                return Column(
//                  children: <Widget>[
//                    Container(
//                      height: 100,
//                      child: Icon(
//                        Icons.account_circle,
//                        size: 100,
//                      ),
//                    ),
//                    SizedBox(height: 50),
//                    Card(
//
//                        child: Column(
//                          children: <Widget>[
//                            Container(
//                              //color:Colors.black,
//                              child: Card(
//                                child: ListTile(
//                                  //  padding: const EdgeInsets.all(8.0),
//                                  title: Text(
//                                    "Name:",
//                                    style: TextStyle(
//                                        fontSize: 17, fontWeight: FontWeight.bold),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 10),
//                            Container(
//                              //color:Colors.black,
//                              child: Card(
//                                child: ListTile(
//                                  //  padding: const EdgeInsets.all(8.0),
//                                  title: Text(
//                                    "Username: ${_model.data}    ",
//                                    style: TextStyle(
//                                        fontSize: 17, fontWeight: FontWeight.bold),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 10),
//                            Container(
//                              // color:Colors.black,
//                              child: Card(
//                                child: ListTile(
//                                  leading: Column(
//                                    children: [
//                                      Text(
//                                        "Geo:",
//                                        style: TextStyle(
//                                            fontSize: 17,
//                                            fontWeight: FontWeight.bold),
//                                      )
//                                    ],
//                                  ),
//                                  //  padding: const EdgeInsets.all(8.0),
//                                  title: Column(children: [
//                                    Row(
//                                      children: [
//                                        Text(
//                                          "Latitude :",
//                                          style: TextStyle(
//                                              fontSize: 15,
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: [
//                                        Text(
//                                          "Longitude:",
//                                          style: TextStyle(
//                                              fontSize: 15,
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ],
//                                    )
//                                  ]),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 10),
//                            Container(
//                              // color:Colors.black,
//                              child: Card(
//                                child: ListTile(
//                                  //  padding: const EdgeInsets.all(8.0),
//                                  title: Text(
//                                    "Mobile No: ${_model.data}   ",
//                                    style: TextStyle(
//                                        fontSize: 17, fontWeight: FontWeight.bold),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        )
//                    )
//                  ],
//                );
//              })),
//    );
//  }
//}
