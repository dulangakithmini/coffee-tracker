import 'package:coffee_crew/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// auth change user stream
  Stream<UserModel> get user {
    /// This sends a User and the map function convert the user to a UserModel
    return _auth
        .authStateChanges()

        /// This map is equal to the map(_userFromFirebaseUser)
        // .map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  /// sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// create user object based on the user from Firebase
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  /// sign in with email and password
  /// register with email and password
  /// sign out
}
