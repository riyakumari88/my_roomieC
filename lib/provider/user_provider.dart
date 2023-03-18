import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  // String specifier = '';
  User get getUser => _user!;
  // String get getspecifier => specifier!;
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    // specifier = user.specifier;
    notifyListeners();
  }
}
