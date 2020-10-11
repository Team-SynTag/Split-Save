import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/User.dart' as game;
import '../services/FirestoreService.dart';
import '../services/service_locator.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  game.User _currentUser;
  game.User get currentUser => _currentUser;

  Future loginWithEmail({@required String email, @required String password}) async {
    try {
      UserCredential authRes = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      await _setCurrentUserOnLogin(authRes.user);

      return authRes.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({@required String username, @required String email, @required String password}) async {
    try {
      var authRes = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      _currentUser = game.User(id: authRes.user.uid, username: username, email: email);

      return authRes.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

  Future _setCurrentUserOnLogin(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
