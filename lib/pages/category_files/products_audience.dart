import 'package:flutter/material.dart';
import 'package:shoe_shop_3/models/category_model.dart';
import 'package:shoe_shop_3/pages/category_files/products_audience.dart';
import 'package:shoe_shop_3/pages/item.dart';
import 'package:shoe_shop_3/reops/category_repo.dart';
import 'package:shoe_shop_3/reops/product_repo.dart';
import 'package:shoe_shop_3/widgets/custom_card2.dart';
import 'package:shoe_shop_3/widgets/custom_card_api.dart';

import '../../models/product_model.dart';
import '../../widgets/custom_drawer_app_mode.dart';
import '../../widgets/search_appbar.dart';

class ProductAudience extends StatefulWidget {
  const ProductAudience({Key? key, required this.value1, required this.value2})
      : super(key: key);

  final String value1;
  final String value2;

  @override
  State<ProductAudience> createState() => _ProductAudienceState();
}

class _ProductAudienceState extends State<ProductAudience> {
  IconData appModeIcon = Icons.sunny;

  void updateAppModeIcon(IconData newIcon) {
    setState(() {
      appModeIcon = newIcon;
    });
  }

  Future<List<ProductShoeModel>>? _categoryData;

  @override
  void initState() {
    super.initState();
    _categoryData = _fetchcategoryData();
  }

  Future<List<ProductShoeModel>> _fetchcategoryData() async {
    final repository = ProductShoeRepository();
    return repository.getByCateNameAndAudienceName(
        widget.value1, widget.value2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: FutureBuilder<List<ProductShoeModel>>(
        future: _categoryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final products = snapshot.data;
            if (products == null || products.isEmpty) {
              return Center(
                child: Text(
                  'No category data found.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            } else {
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Display three items in each line
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  var category = products[index].cateId![0];
                  var audience = products[index].audiId![0];
                  final prod = products[index];
                  var prodName = category.name;
                  double? prodPrice = prod.price?.toDouble();
                  var prodDetails = prod.details;
                  var prodImage = prod.image;

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ItemPage();
                        },
                      ));
                      print(
                          '===========image : ${products[index].image ?? ''}');
                    },
                    child: CustomCard(
                      imageUrl: prodImage ?? '',
                      productName: prodName ?? '',
                      details: prodDetails ?? '',
                      price: prodPrice ?? 0.0,
                    // ),
                    // child: Column(
                    //   children: [
                    //     Image.network('$prodImage'),
                    //     Text('$prodName'),
                    //     Text('$prodDetails'),
                    //     Text('${prodPrice.toString()}'),
                    //   ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
