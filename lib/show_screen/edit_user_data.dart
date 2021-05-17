import 'package:flutter/material.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';

import '../getAll_projectfile.dart';

class EditUserData extends StatefulWidget {
  final User updateUserData;

  EditUserData({this.updateUserData});

  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  TextEditingController editName = TextEditingController();
  TextEditingController editUsername = TextEditingController();
  TextEditingController editPhone = TextEditingController();
  TextEditingController editLat = TextEditingController();
  TextEditingController editLng = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editName = TextEditingController(text: widget.updateUserData.name);
    editUsername = TextEditingController(text: widget.updateUserData.username);
    editLat = TextEditingController(text: widget.updateUserData.lat);
    editLng = TextEditingController(text: widget.updateUserData.lng);
    editPhone = TextEditingController(text: widget.updateUserData.phone);
  }

  @override
  Widget build(BuildContext context) {
    print('User Details');
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
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
                  controller: editName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: TextFormField(
                  controller: editUsername,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'UserName'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: TextFormField(
                  controller: editLat,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Latitude'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: TextFormField(
                  controller: editLng,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Longitude'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: TextFormField(
                  controller: editPhone,
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
                            User(
                                name: editName.text,
                                username: editUsername.text,
                                lat: editLat.text,
                                lng: editLng.text,
                                phone: editPhone.text),
                        );
                    print(editName.text);
                    print(editUsername.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
