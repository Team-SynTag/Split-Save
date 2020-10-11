import 'package:flutter/widgets.dart';

import '../services/service_locator.dart';
import '../services/AuthenticationService.dart';
import '../models/User.dart' as game;

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authService = locator<AuthenticationService>();

  game.User get currentUser => _authService.currentUser;

  bool _busy = false;
  bool get isBusy => _busy;

  void setBusy(bool val) {
    _busy = val;
    notifyListeners();
  }
}
