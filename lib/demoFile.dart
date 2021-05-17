import 'package:flutter/material.dart';

class WorkGround extends StatefulWidget {
  @override
  _WorkGroundState createState() => _WorkGroundState();
}

class _WorkGroundState extends State<WorkGround> {
  final _formKey = GlobalKey<FormState>();
  final _usernameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();

  /*
  * Step 1.
  * */
  String _userNameErrorText;
  bool _userNameError = false;
  String _phoneNumberErrorText;
  bool _phoneNumberError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              focusNode: _usernameFocusNode,
              decoration: InputDecoration(
                labelText: 'Username',
                /*
                * Step 2
                * */
                errorText: _userNameErrorText, // Handling error manually
              ),
              textInputAction: TextInputAction.next,
              /*
              * Step 3
              * */
              validator: (value) {
                setState(() {
                  if(value.isEmpty) {
                    _userNameError = true;
                    _userNameErrorText = 'Enter Username';
                  }
                });
                return null; // Return null to handle error manually.
              },
              /*
              * Step 4
              * */
              onChanged: (value) {
                setState(() {
                  _userNameError = false;
                  _userNameErrorText = null; // Resets the error
                });
              },
              /*
              * Step 5
              * */
              onFieldSubmitted: (value) {
                _formKey.currentState.validate(); // Trigger validation
                if(!_userNameError) {
                  FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                }
              },
            ),
            TextFormField(
              focusNode: _phoneNumberFocusNode,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                /*
                * Step 2
                * */
                errorText: _phoneNumberErrorText, // Handling error manually
              ),
              textInputAction: TextInputAction.done,
              /*
              * Step 3
              * */
              validator: (value) {
                setState(() {
                  if(value.isEmpty) {
                    _phoneNumberError = true;
                    _phoneNumberErrorText = 'Enter Phone number';
                  } else if( value.length < 10) {
                    _phoneNumberError = true;
                    _phoneNumberErrorText = 'Invalid Phone number';
                  }
                });
                return null; // Return null to handle error manually.
              },
              /*
              * Step 4
              * */
              onChanged: (value) {
                setState(() {
                  _phoneNumberError = false;
                  _phoneNumberErrorText = null; // Resets the error
                });
              },
              /*
              * Step 5
              * */
              onFieldSubmitted: (value) {
                _formKey.currentState.validate(); // Trigger validation
                if(!_phoneNumberError) {
                  // submit form or whatever your code flow is...
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}