import 'package:coffee_crew/models/user_model.dart';
import 'package:coffee_crew/screens/Authentication/authentication_screen.dart';
import 'package:coffee_crew/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);

    /// return either home or aythentication
    if (user == null) {
      return AuthenticationScreen();
    } else {
      return HomeScreen();
    }
  }
}
