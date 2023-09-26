import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_shop_3/pages/all_categories.dart';
import 'package:shoe_shop_3/pages/category.dart';
import 'package:shoe_shop_3/widgets/custom_drawer_app_mode.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

class BaseCategoriesPage extends StatefulWidget {
  const BaseCategoriesPage({super.key});

  @override
  State<BaseCategoriesPage> createState() => _BaseCategoriesPageState();
}

List<BaseCategoryClass> baseCategoriesList = [
  BaseCategoryClass(
    name: "Men",
    // icon: Icons.man,
    image: "assets/images/background/men-background.jpg",
  ),
  BaseCategoryClass(
    name: "Women",
    // icon: Icons.woman,
    image: "assets/images/background/women-background3.jpg",
  ),
  BaseCategoryClass(
    name: "Boys",
    // icon: Icons.boy,
    image: "assets/images/background/boy-background1.webp",
  ),
  BaseCategoryClass(
    name: "Girls",
    // icon: Icons.girl,
    image: "assets/images/background/girls-background3.jpg",
  ),
  BaseCategoryClass(
    name: "Babies",
    // icon: Icons.baby_changing_station_sharp,
    image: "assets/images/background/baby-background1.jpg",
  ),
];

class BaseCategoryClass {
  final String name;
  // final IconData icon;
  final String image;

  BaseCategoryClass({
    required this.name,
    // required this.icon,
    required this.image,
  });
}

class _BaseCategoriesPageState extends State<BaseCategoriesPage> {
  IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: baseCategoriesList.length,
          itemBuilder: (BuildContext context, index) {
            return BaseCategoriesWidget(
              baseCategory: baseCategoriesList[index],
            );
          },
        ),
      ),
    );
  }
}

class BaseCategoriesWidget extends StatelessWidget {
  const BaseCategoriesWidget({super.key, required this.baseCategory});
  final BaseCategoryClass baseCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AllCategoriesPage(shoeType: baseCategory.name,);
            }));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  baseCategory.image,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), // Adjust background image opacity (0.0 to 1.0)
                  BlendMode.srcOver,
                ),
              ),
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   baseCategory.icon,
                  //   size: 32,
                  //   color: Colors.white,
                  // ),
                  SizedBox(width: 16.0),
                  Text(
                    baseCategory.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
