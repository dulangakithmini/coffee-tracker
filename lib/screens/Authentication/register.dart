import 'package:coffee_crew/services/auth_service.dart';
import 'package:coffee_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  /// States of the TextFormFields
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Coffee Crew'),
        actions: <Widget>[
          OutlinedButton.icon(
            onPressed: () async {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.length < 6
                      ? 'Enter a password with at least 7 characters'
                      : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  onPressed: () async {
                    /// validate the current values in the form
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please enter a valid email';
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
                // ElevatedButton(
                //   child: Text(
                //     'Sign in Anonymously',
                //     style: TextStyle(
                //       fontSize: 17,
                //       color: Colors.black,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white,
                //   ),
                //   onPressed: () async {
                //     dynamic result = await _auth.signInAnon();
                //     if (result == null) {
                //       print('Error signing in!');
                //     } else {
                //       print('signed in');
                //       print(result);
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
