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
  final editName = TextEditingController();
  final editUsername = TextEditingController();
  final editPhone = TextEditingController();
  final editLat = TextEditingController();
  final editLng = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('User Details');
    final _model = Provider.of<ApiServices>(context);
    editName.text = _model.onTappedUser.name;
    editUsername.text = _model.onTappedUser.username;
    editLat.text = _model.onTappedUser.lat;
    editLng.text = _model.onTappedUser.lng;
    editPhone.text = _model.onTappedUser.phone;

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
                controller: editName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: editUsername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UserName'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: editLat,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Latitude'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: editLng,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Longitude'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: editPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile'
                ),
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
                  _model.onTappedUsersData(
                    editName.text,
                    editUsername.text,
                    editLat.text,
                    editLng.text,
                    editPhone.text,
                  );

                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserData()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
