import 'package:coffee_crew/models/user_model.dart';
import 'package:coffee_crew/screens/wrapper.dart';
import 'package:coffee_crew/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
