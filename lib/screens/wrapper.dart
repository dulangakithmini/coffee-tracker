import 'package:coffee_crew/screens/Authentication/authentication_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// return either home or aythentication
    return AuthenticationScreen();
  }
}
