import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/auth_helper.dart';
import '../pages/account.dart';
import '../pages/login.dart';
import '../pages/login2.dart';

PreferredSizeWidget buildSearchAppBar(BuildContext context) {
  AuthenticationProvider authProvider =
      Provider.of<AuthenticationProvider>(context);
  bool isLoggedIn = AuthenticationProvider.isLoggedIn.value;
  String? userProfile = AuthenticationProvider.userProfile;

  return AppBar(
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Container(
      height: 40.0,
      width: 300.0,
      child: TextField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(168, 82, 80, 80),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromARGB(168, 71, 70, 70),
          ),
        ),
        onSubmitted: (value) {
          // Perform search action with the submitted value
        },
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: isLoggedIn
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return LoginPage2(
                        email: "",
                        password: "",
                      );
                    }),
                  );
                },
                child: Icon(Icons.login),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return UserAccount();
                    }),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    userProfile ?? "assets/images/profiles/profile1.png",
                  ),
                ),
              ),
      ),
    ],
  );
}