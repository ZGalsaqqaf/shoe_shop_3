import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_3/my_tests/tests.dart';

import '../pages/account.dart';
import '../pages/category.dart';
import '../pages/favorites.dart';
import '../theme/theme_provider.dart';

class TestCustomDrawerWithAppMode extends StatefulWidget {
  final Function(IconData) updateAppModeIcon;

  const TestCustomDrawerWithAppMode({Key? key, required this.updateAppModeIcon}) : super(key: key);

  @override
  _TestCustomDrawerWithAppModeState createState() => _TestCustomDrawerWithAppModeState();
}

class _TestCustomDrawerWithAppModeState extends State<TestCustomDrawerWithAppMode> {
  IconData appModeIcon = Icons.light_mode;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UserAccount();
              }));
            },
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profiles/profile1.png"),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("user@gmail.com"),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle Home navigation
              Navigator.pushNamed(context, '/'); // Close the drawer
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Text('Sneakers'),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CategoryPage();
              }));
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Favorite'),
            onTap: () {
              // Handle Home navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FavoritePage();
              }));
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(appModeIcon),
            title: Text("Dark Mode"),
            trailing: Switch(
              value: appModeIcon == Icons.dark_mode,
              onChanged: (newValue) {
                  appModeIcon = appModeIcon == Icons.light_mode
                      ? Icons.dark_mode
                      : Icons.light_mode;

                widget.updateAppModeIcon(appModeIcon);

                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.toggleTheme();

                setState(() {
                });
                
                print("==== Change App Mode === ");
              },
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Text('Tests'),
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
}