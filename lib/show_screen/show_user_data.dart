import 'package:flutter/material.dart';
import 'package:tech_post_app/show_screen/edit_user_data.dart';
import '../getAll_projectfile.dart';
class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<ApiServices>(
//      create: (BuildContext context) {
//        print('Provider call');
//        return ApiServices();
//      },
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowUserData(),
    );
  }
}

class ShowUserData extends StatefulWidget {
  @override
  _ShowUserDataState createState() => _ShowUserDataState();
}

class _ShowUserDataState extends State<ShowUserData> {
  @override
  Widget build(BuildContext context) {
   // print('User Details');
    final _model = Provider.of<ApiServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditUserData()),
                );
              },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(183, 182, 185, 0.1),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Icon(
                      Icons.account_circle,
                      size: 100,
                    ),
                  ),
                  SizedBox(height: 50),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Card(
                            child: ListTile(
                              title: Text(
                                "Name:${_model.onTappedUser.name}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Card(
                            child: ListTile(
                              title: Text(
                                "Username: ${_model.onTappedUser.username}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Card(
                            child: ListTile(
                              leading: Column(
                                children: [
                                  Text(
                                    "Geo:",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              //  padding: const EdgeInsets.all(8.0),
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Latitude:${_model.onTappedUser.lat}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Longitude:${_model.onTappedUser.lng}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          // color:Colors.black,
                          child: Card(
                            child: ListTile(
                              title: Text(
                                "Mobile No:${_model.onTappedUser.phone} ",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
