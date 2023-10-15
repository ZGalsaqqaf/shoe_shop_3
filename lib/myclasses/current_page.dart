
import 'package:flutter/cupertino.dart';

import '../pages/account.dart';
import '../pages/cart.dart';
import '../pages/category.dart';
import '../pages/home.dart';

/////////////////////////////
/// This page not used
////////////////////////////

class CurrentPage {
  late int page = 0;

  var pagesList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    // UserAccount(),
  ];
  
  void setPageIndex(int currentPage){
    page = currentPage;
  }

  int getPageIndex (){
    print("get page Index (from current page class): $page");
    return page;
  }

  Widget getPage(){
    print("pagesList[page]");
    return pagesList[page];
  }
}