import 'package:flutter/material.dart';

class AuthenticationProvider {
  static ValueNotifier<bool> isLoggedIn = ValueNotifier(false);

  static String? userId;

  static void login(String id) {
    isLoggedIn.value = true;
    userId = id;
  }

  static void logout() {
    isLoggedIn.value = false;
    userId = null;
  }
}