import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_3/my_tests/tests.dart';
import 'package:shoe_shop_3/my_tests/theme_manager.dart';
import 'package:shoe_shop_3/myclasses/category_class.dart';
import 'package:shoe_shop_3/pages/account.dart';
import 'package:shoe_shop_3/pages/category.dart';
import 'package:shoe_shop_3/pages/favorites.dart';
import 'package:shoe_shop_3/theme/theme_provider.dart';

CategoryGenerator catGen = CategoryGenerator();
IconData appModeIcon = Icons.light_mode;
ThemeManager themeManager = ThemeManager();

Widget TestCustomDrawerWithAppMode(
    BuildContext context, Function(IconData) updateAppModeIcon) {
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
              // appModeIcon = Icons.home;
              appModeIcon = appModeIcon == Icons.light_mode
                  ? Icons.dark_mode
                  : Icons.light_mode;
              // setState(() {});  // do not work
              updateAppModeIcon(appModeIcon);

              final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  themeProvider.toggleTheme();

              print("==== Change App Mode === ");
            },
          ),
        ),

        Divider(),

        // نقلتها الى ايقونة الاعدادات في ال appBar
        // ListTile(
        //   leading: Icon(Icons.login),
        //   title: Text('Login'),
        //   onTap: () {
        //     // Handle Home navigation
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //       return LoginPage();
        //     }));
        //   },
        // ),

        // Divider(),

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
