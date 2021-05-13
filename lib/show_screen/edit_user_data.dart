import 'package:flutter/material.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';

import '../getAll_projectfile.dart';

class EditUserData extends StatefulWidget {
  final User updateUserIndex;

  EditUserData({this.updateUserIndex});

  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  final editName = TextEditingController();
  final editUsername = TextEditingController();
  final editPhone = TextEditingController();
  final editLat = TextEditingController();
  final editLng = TextEditingController();

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    editName.text;
//    editUsername.text;
//    editLat.text;
//    editLng.text;
//    editPhone.text;
//  }

  @override
  Widget build(BuildContext context) {
    print('User Details');
    final _model = Provider.of<PostListViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit User Details'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                'Update User Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: TextFormField(
                controller:
                    TextEditingController(text: _model.onTappedUser.name),
                onChanged: (value) {
                  editName.text = value;
                  print('Name Change::${value}');
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller:
                    TextEditingController(text: _model.onTappedUser.username),
                onChanged: (value) {
                  editUsername.text = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller:
                    TextEditingController(text: _model.onTappedUser.lat),
                onChanged: (value) {
                  editLat.text = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Latitude'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller:
                    TextEditingController(text: _model.onTappedUser.lng),
                onChanged: (value) {
                  editLng.text = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Longitude'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller:
                    TextEditingController(text: _model.onTappedUser.phone),
                onChanged: (value) {
                  editPhone.text = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Mobile'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: ElevatedButton(
                child: Text(
                  'Update User',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    ShowUserData(
                      userIndex: _model.onTappedUsersData(
                        PostWithUsername(
                          name: editName.text,
                          username: editUsername.text,
                          lat: editLat.text,
                          lng: editLng.text,
                          phone: editPhone.text,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
