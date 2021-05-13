import 'package:flutter/material.dart';
import 'package:tech_post_app/show_screen/edit_user_data.dart';
import '../getAll_projectfile.dart';

class ShowUserData extends StatefulWidget {
  final User userIndex;

  ShowUserData({this.userIndex});

  @override
  _ShowUserDataState createState() => _ShowUserDataState();
}

class _ShowUserDataState extends State<ShowUserData> {
  @override
  void initState() {
    // TODO: implement initState

    widget.userIndex.name;
    widget.userIndex.username;
    widget.userIndex.lat;
    widget.userIndex.lng;
    widget.userIndex.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {

                  print('Edit');
             await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditUserData(
                        updateUserData: User(
                            name: widget.userIndex.name,
                            username: widget.userIndex.username,
                            lat: widget.userIndex.lat,
                            lng: widget.userIndex.lng,
                            phone: widget.userIndex.phone),
                      ),
                    ),
                  );

                  print('Show Name:${widget.userIndex.name}');
                  print('Show Username:${widget.userIndex.username}');
                 // print(data.toString());

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
                                //'Name',
                                "Name:${widget.userIndex.name}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Card(
                            child: ListTile(
                              title: Text(
                                //'Username',
                                "Username: ${widget.userIndex.username}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
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
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              //  padding: const EdgeInsets.all(8.0),
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        //'Latitude',
                                        'Latitude:${widget.userIndex.lat}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        // 'Longitude',
                                        'Longitude:${widget.userIndex.lng}',
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
                                //  'Mobile',
                                "Mobile No:${widget.userIndex.phone} ",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
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
