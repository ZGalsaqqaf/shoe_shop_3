import 'package:flutter/material.dart';

class AuthenticationProvider {
  static ValueNotifier<bool> isLoggedIn = ValueNotifier(false);

  static String? userId;
  static String? userName;
  static String? userEmail;
  static String? userProfile;

  static void login(String id, String name, String email, String profile) {
    isLoggedIn.value = true;
    userId = id;
    userName = name;
    userEmail = email;
    userProfile = profile;
  }

  static void logout() {
    isLoggedIn.value = false;
    userId = null;
  }
}