import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_3/my_tests/tests.dart';
import 'package:shoe_shop_3/myclasses/category_class.dart';
import 'package:shoe_shop_3/pages/about.dart';
import 'package:shoe_shop_3/pages/account.dart';
import 'package:shoe_shop_3/pages/category.dart';
import 'package:shoe_shop_3/pages/favorites.dart';
import 'package:shoe_shop_3/pages/login.dart';
import 'package:shoe_shop_3/theme/theme_provider.dart';

CategoryGenerator catGen = CategoryGenerator();
IconData appModeIcon = Icons.light_mode;

Widget CustomDrawerWithAppMode(
    BuildContext context, Function(IconData) updateAppModeIcon) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.6,
    child:ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return UserAccount();
            }));
          },
          child: UserAccountsDrawerHeader(
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
        // ListTile(
        //   title: Text(
        //     'Categories',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 16,
        //       color: Theme.of(context).colorScheme.tertiary,
        //     ),
        //   ),
        // ),
        ListTile(
          leading: Icon(Icons.shopping_cart,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: Text('My Cart',
          style: Theme.of(context).textTheme.headline3,),
          onTap: () {
            // Handle Home navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CategoryPage();
            }));
          },
        ),
        Divider(),
        // ListTile(
        //   leading: Icon(Icons.favorite,
        //     color: Theme.of(context).colorScheme.tertiary,
        //   ),
        //   title: Text('My Favorite',
        //   style: Theme.of(context).textTheme.headline3,),
        //   onTap: () {
        //     // Handle Home navigation
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //       return FavoritePage();
        //     }));
        //   },
        // ),
        // Divider(),
        ListTile(
          leading: Icon(appModeIcon,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: Text("Dark Mode",
          style: Theme.of(context).textTheme.headline3,),
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
          leading: Icon(Icons.login,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: Text('Login',
          style: Theme.of(context).textTheme.headline3,),
          onTap: () {
            // Handle Home navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.info,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: Text('About Us',
          style: Theme.of(context).textTheme.headline3,),
          onTap: () {
            // Handle Home navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AboutUsPage();
            }));
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.subdirectory_arrow_right,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          title: Text('Tests',
          style: Theme.of(context).textTheme.headline3,),
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
