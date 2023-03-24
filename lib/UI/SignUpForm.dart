import 'package:app_1/UI/drawer_menu.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _loginformKey = GlobalKey<FormState>();
  String? _name;
  String? _phone;
  String? _password;
  String? _confirmPassword;

  void _submit() {
    if (_loginformKey.currentState!.validate()) {
      _loginformKey.currentState!.save();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Form submitted successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return drawer_menu();
                  }),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginformKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Name field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                } else {
                  _name = value;
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            //phone number field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a phone number';
                }
                if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
                  return 'Phone must be start with + and 10 chars long.';
                } else {
                  _phone = value;
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            //Password field
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                if (!RegExp(
                        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$")
                    .hasMatch(value)) {
                  return 'Password must be at least 6 characters and include at least one uppercase letter, one lowercase letter, one number, and one special character';
                } else {
                  _password = value;
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            //Confirm password field
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password) {
                  print(_password);
                  return 'Passwords do not match';
                } else {
                  _confirmPassword = value;
                }
                return null;
              },
            ),

            SizedBox(height: 16.0),

            //Submit Btn
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
