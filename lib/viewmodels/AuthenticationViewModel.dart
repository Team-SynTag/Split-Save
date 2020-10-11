import 'package:flutter/foundation.dart';

import 'BaseModel.dart';
import '../services/service_locator.dart';
import '../services/AuthenticationService.dart';

enum AuthenticationResult { SUCCESS, FAILURE }
enum AuthType { LOGIN, SIGNUP }

class AuthenticationViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<AuthenticationResult> authenticate({String username, @required String email, @required String password, @required AuthType aType}) async {
    if (aType == AuthType.SIGNUP) {
      setBusy(true);
      var signUpResult = await _authenticationService.signUpWithEmail(username: username, email: email, password: password);

      if (signUpResult is bool) {
        if (signUpResult) {
          return AuthenticationResult.SUCCESS;
        } else {
          // might wanna add a fluttertoast here
          return AuthenticationResult.FAILURE;
        }
      } else {
        // might also wanna add a fluttertoast here too
        return AuthenticationResult.FAILURE;
      }
    } else {
      setBusy(true);
      var loginResult = await _authenticationService.loginWithEmail(email: email, password: password);

      if (loginResult is bool) {
        if (loginResult) {
          return AuthenticationResult.SUCCESS;
        } else {
          // might wanna add a fluttertoast here
          return AuthenticationResult.FAILURE;
        }
      } else {
        // might also wanna add a fluttertoast here too
        return AuthenticationResult.FAILURE;
      }
    }
  }
}
