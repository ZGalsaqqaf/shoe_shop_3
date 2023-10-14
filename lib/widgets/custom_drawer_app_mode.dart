import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_3/models/user_model.dart';
import 'package:shoe_shop_3/my_tests/tests.dart';
import 'package:shoe_shop_3/myclasses/category_class.dart';
import 'package:shoe_shop_3/pages/about.dart';
import 'package:shoe_shop_3/pages/account.dart';
import 'package:shoe_shop_3/pages/cart.dart';
import 'package:shoe_shop_3/reops/user_repo.dart';
import 'package:shoe_shop_3/theme/theme_provider.dart';

import '../helper/auth_helper.dart';
import '../pages/login2.dart';

CategoryGenerator catGen = CategoryGenerator();
IconData appModeIcon = Icons.light_mode;

Widget CustomDrawerWithAppMode(
  BuildContext context, Function(IconData) updateAppModeIcon) {
    bool isLoggedIn = AuthenticationProvider.isLoggedIn.value;
    String? uId = AuthenticationProvider.userId;
    String? uName = AuthenticationProvider.userName;
    String? uEmail = AuthenticationProvider.userEmail;
    String? uProfile = AuthenticationProvider.userProfile;
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('$uName and $uEmail');
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return UserAccount();
              // }));
            },
            child: isLoggedIn
                ? UserAccountsDrawerHeader(
                    accountName: Text(uName ?? "Username"),
                    accountEmail: Text(uEmail ?? "aa@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: uProfile!.isNotEmpty
                              ? MemoryImage(base64Decode(uProfile))
                                  as ImageProvider<Object>?
                              : AssetImage("assets/images/profiles/profile1.png"),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : UserAccountsDrawerHeader(
                    accountName: Text("Username"),
                    accountEmail: Text("aa@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profiles/profile1.png"),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
            //////
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text('Home'),
            onTap: () {
              // Handle Home navigation
              Navigator.pushNamed(context, '/'); // Close the drawer
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text(
              'My Cart',
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CartPage();
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              appModeIcon,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text(
              "Dark Mode",
              style: Theme.of(context).textTheme.headline3,
            ),
            trailing: Switch(
              value: appModeIcon == Icons.dark_mode,
              onChanged: (newValue) {
                // appModeIcon = Icons.home;
                appModeIcon = appModeIcon == Icons.light_mode
                    ? Icons.dark_mode
                    : Icons.light_mode;

                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.toggleTheme();

                updateAppModeIcon(appModeIcon);

                print("==== Change App Mode === ");
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text(
              'Login',
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LoginPage2(
                  email: "",
                  password: "",
                );
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text(
              'About Us',
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AboutUsPage();
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.subdirectory_arrow_right,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            title: Text(
              'Tests',
              style: Theme.of(context).textTheme.headline3,
            ),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TestsPage();
              }));
            },
          ),
          Divider(),
        ],
      ),
    );
}
