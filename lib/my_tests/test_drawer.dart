import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_shop_3/widgets_old/custom_drawer.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../myclasses/category_class.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({super.key});

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {
  CategoryGenerator catGen = CategoryGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
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
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Handle Home navigation
                  Navigator.pop(context); // Close the drawer
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

              // ...catGen.map(c)
            ],
          ),
        ),
        body: Column(
          children: [Text("dataa")],
        ),
      ),
    ));
  }
}
