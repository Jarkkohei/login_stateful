import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if(!value.contains('@')) {
          return 'Please enter a valid email.';
        }
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      obscureText: true,
      validator: (String value) {
        if(value.length < 6) {
          return 'Password has to be atleast 6 characters long.';
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();
          print('Logindata: $_email, $_password');
        }
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            SizedBox(height: 25.0),
            passwordField(),
            // Another way of adding margin.
            Container(margin:EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }
}