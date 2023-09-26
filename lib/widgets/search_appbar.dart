import 'package:flutter/material.dart';
import 'package:shoe_shop_3/pages/about.dart';

import '../pages/login.dart';

AppBar SearchAppBar(BuildContext context) {
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
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(168, 82, 80, 80),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromARGB(168, 71, 70, 70),
          )
        ),
        onSubmitted: (value) {
          // Perform search action with the submitted value
        },
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: PopupMenuButton<String>(
          icon: Icon(Icons.settings),
          onSelected: (String value) {
            // Handle menu item selection
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'login',
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text('Login'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'about',
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AboutUsPage();
                    }));
                  },
                  child: Text('About Us'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Option 3',
                child: Text('Option 3'),
              ),
            ];
          },
        ),
      ),
    ],
  );
}
