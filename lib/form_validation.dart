import 'package:flutter/material.dart';

class Form_Validation extends StatefulWidget {
  @override
  _Form_ValidationState createState() => _Form_ValidationState();
}

class _Form_ValidationState extends State<Form_Validation> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  bool isButtonValidate = false;

//r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+.com";
  String emailPattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  var _formKey = GlobalKey<FormState>();

//  void validateAndSave() {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      print('Form is valid');
//    } else {
//      print('form is invalid');
//    }
//  }
  bool isButtonEnabled() {
    setState(
      () {
        if ((txtName.text != '') &&
            (txtMobile.text != '') &&
            (txtEmail.text != '')) {
          final formValid = _formKey.currentState;
          if (formValid.validate()) {
            print('Form is valid');
            // validateAndSave();
            isButtonValidate = true;
          } else {
            print('form is invalid');
            isButtonValidate = false;
          }
        } else {
          isButtonValidate = false;
        }
      },
    );
    return isButtonValidate;
  }

  @override
  Widget build(BuildContext context) {
    print('Form Validation');
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'User Data',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                  child: TextFormField(
                    controller: txtName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
//                        errorText:
//                        isNameValid ? null : "Please enter valid name!"
                    ),
                    validator: (value) {
                      RegExp nameRegExp = new RegExp(r'^[a-zA-Z ]+$');
                      if (!nameRegExp.hasMatch(value)) {
                        return 'Please Enter Valid Name!';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      isButtonEnabled();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextFormField(
                    controller: txtMobile,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Mobile'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.length != 10) {
                        return 'Please Enter Valid MobileNo!';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      isButtonEnabled();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextFormField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                    validator: (value) {
                      RegExp emailRegExp = new RegExp(emailPattern);
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Enter Valid Email address';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      isButtonEnabled();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: ElevatedButton(
                    child: Text(
                      'Validate',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: isButtonValidate
                        ? () {
                            print("Button Enabled");
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
