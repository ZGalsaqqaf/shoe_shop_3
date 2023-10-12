import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_shop_3/models/category_model.dart';
import 'package:shoe_shop_3/myclasses/category_class.dart';
import 'package:shoe_shop_3/reops/category_repo.dart';

import '../../widgets/custom_drawer_app_mode.dart';
import '../../widgets/search_appbar.dart';

class CategoryGetByField extends StatefulWidget {
  const CategoryGetByField(
      {super.key, required this.field, required this.value});
  final String field;
  final String value;

  @override
  State<CategoryGetByField> createState() => _CategoryGetByFieldState();
}

class _CategoryGetByFieldState extends State<CategoryGetByField> {
  IconData appModeIcon = Icons.sunny;

  void updateAppModeIcon(IconData newIcon) {
    setState(() {
      appModeIcon = newIcon;
    });
  }

  Future<List<CategoryModel>>? _categoryData;

  @override
  void initState() {
    super.initState();
    _categoryData = _fetchcategoryData();
  }

  Future<List<CategoryModel>> _fetchcategoryData() async {
    final repository = CategoryRepository();
    return repository.getByField(widget.field, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: FutureBuilder<List<CategoryModel>>(
        future: _categoryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final categories = snapshot.data;
            if (categories == null || categories.isEmpty) {
              return Text('No category data found.');
            } else {
              return GridView.count(
                crossAxisCount: 3, // Display three items in each line
                padding: EdgeInsets.all(10.0),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      //   return CategoryPage();
                      // }));
                      print(
                          '===========image : ${categories[index].image ?? ''}');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(categories[index].image ?? ''),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.2),
                            BlendMode.srcOver,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2), // Set the background color with opacity
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                                vertical: 3.0,
                              ),
                              child: Text(
                                '${categories[index].name}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }
          }
        },
      ),
    );
  }
}
