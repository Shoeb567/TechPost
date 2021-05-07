import 'package:flutter/material.dart';
import 'package:tech_post_app/show_screen/show_user_data.dart';

import '../getAll_projectfile.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //  resizeToAvoidBottomPadding: false,
      home: EditUserData(),
    );
  }
}

class EditUserData extends StatefulWidget {
  @override
  _EditUserDataState createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  final TextEditingController editName = TextEditingController();
  final TextEditingController editUsername = TextEditingController();
  final TextEditingController editPhone = TextEditingController();
  final TextEditingController editLnt = TextEditingController();
  final TextEditingController editLng = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('User Details');
    final _model = Provider.of<ApiServices>(context);
    // editName.text = _model
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit User Details'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _model.onTappedUserList.length,
          itemBuilder: (BuildContext context, index) {
            editName.text = _model.onTappedUserList[index].name;
            editUsername.text = _model.onTappedUserList[index].username;
            editPhone.text = _model.onTappedUserList[index].phone;
            return Column(
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
                  child: TextField(
                    controller: editName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: '${_model.userData[index].name}',
                        labelText: 'Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextField(
                    controller: editUsername,
                    decoration: InputDecoration(
                        // hintText: '${_model.userData[index].username}',
                        border: OutlineInputBorder(),
                        labelText: 'UserName'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextField(
                    // controller: updateLnt,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Latitude'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextField(
                    // controller: updateLng,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Longitude'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextField(
                    controller: editPhone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: '${_model.userData[index].phone}',
                        labelText: 'Mobile'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: ElevatedButton(
                   // color: Colors.blue,
                    child: Text(
                      'Update User',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _model.onTappedUsersData(
                        editName.text,
                        editUsername.text,
                        editPhone.text,
                        editPhone.text,
                        editPhone.text,
                      );

                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserData()));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
