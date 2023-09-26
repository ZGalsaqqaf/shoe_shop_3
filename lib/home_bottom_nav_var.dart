import 'package:flutter/material.dart';
import 'package:shoe_shop_3/pages/account.dart';
import 'package:shoe_shop_3/pages/cart.dart';
import 'package:shoe_shop_3/pages/category.dart';
import 'package:shoe_shop_3/pages/home.dart';

import 'myclasses/btmNavBarPages.dart';
import 'widgets/custom_botto_nav_bar.dart'; // Update with the correct import path

class HomeBtmNavBarPage extends StatefulWidget {
  const HomeBtmNavBarPage({Key? key});

  @override
  State<HomeBtmNavBarPage> createState() => _HomeBtmNavBarPageState();
}

class _HomeBtmNavBarPageState extends State<HomeBtmNavBarPage> {
  int _currentIndex = 0;
  // var pagesList = [
  //   HomePage(),
  //   CategoryPage(),
  //   CartPage(),
  //   UserAccount(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBtmNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print("==== bottom index: $index ===");
        },
      ),
      body: pagesList[_currentIndex],
    );
  }
}