import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../models/User.dart' as gameUser;

class FirestoreService {
  final CollectionReference _usersCollectionRef = FirebaseFirestore.instance.collection('users');

  Future createUser(gameUser.User user) async {
    try {
      await _usersCollectionRef.doc(user.id).set(user.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      } else {
        return e.toString();
      }
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionRef.doc(uid).get();
      return gameUser.User.fromMap(userData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      } else {
        return e.toString();
      }
    }
  }
}
