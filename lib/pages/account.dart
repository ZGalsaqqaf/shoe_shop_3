import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets/custom_botto_nav_bar.dart';
import '../widgets/custom_drawer_app_mode.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String _name = 'Zhr';
  String _email = 'zhr@example.com';
  String _address = '123 Main St, City, Country';
  String _imageProfile = 'assets/images/profiles/profile1.png';
  
  @override
  Widget build(BuildContext context) {
    IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(
                  _imageProfile), // Add your profile image asset here
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome, $_name!',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: $_email',
              style:Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 16.0),
            Text(
              'Address: $_address',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle logout action
              },
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Handle logout action
              },
              child: Text(
                'Logout', 
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
