import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  late final String name;
  late final IconData icon;

  Category({required this.name, required this.icon});
}

class CategoryGenerator {

  final List<String>categoryNames = ["Sneakers", "Boots", "Dress Shoes", "High Heels", "Sandals"];

  final List<Category> categoryGroup = [

    // Category(
    //   name: "Sneakers", 
    //   icon: Icons.subdirectory_arrow_right
    // ),

    // Category(
    //   name: "Boots", 
    //   icon: Icons.subdirectory_arrow_right
    // ),

    // Category(
    //   name: "High Heels", 
    //   icon: Icons.subdirectory_arrow_right
    // ),

    // Category(
    //   name: "Dress Shoes", 
    //   icon: Icons.subdirectory_arrow_right
    // ),

    // Category(
    //   name: "Sandals", 
    //   icon: Icons.subdirectory_arrow_right
    // ),

  ];

  CategoryGenerator(){
    for (var i = 0; i < categoryNames.length; i++) {
      categoryGroup.add(
        Category(
          name: categoryNames[i], 
          icon: Icons.subdirectory_arrow_right
        ),
      );
    }
    print(categoryGroup);
  }
}