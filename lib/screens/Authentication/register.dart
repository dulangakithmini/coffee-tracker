import 'package:coffee_crew/services/auth_service.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  /// States of the TextFormFields
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Coffee Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              TextFormField(
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
                  print(email);
                  print(password);
                },
              ),
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
    );
  }
}
