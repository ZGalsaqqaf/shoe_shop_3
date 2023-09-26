import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets/custom_drawer_app_mode.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String _name = 'Zhr';
  String _email = 'johndoe@example.com';
  String _address = '123 Main St, City, Country';
  String _imageProfile = 'assets/images/profiles/profile1.png';
  List<String> _favoriteList = [
    'Nike Air Max',
    'Adidas Ultraboost',
    'Puma RS-X',
  ];
  @override
  Widget build(BuildContext context) {
    IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }

    return Scaffold(
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(_imageProfile), // Add your profile image asset here
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome, $_name!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: $_email',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Address: $_address',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'My Favorites:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _favoriteList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_favoriteList[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
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
