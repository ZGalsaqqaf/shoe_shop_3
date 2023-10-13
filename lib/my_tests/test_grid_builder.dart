import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets_old/custom_drawer.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';
import '../pages/fake_pages.dart';
import '../widgets/custom_card2.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({Key? key}) : super(key: key);

  @override
  State<TestsPage> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  int _itemCount = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(context),
      drawer: CustomDrawer(context),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.6, // Adjust the aspect ratio to increase the height
        ),
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ItemPage();
                }),
              );
            },
            child: CustomCard2(context),
          );
        },
      ),
    );
  }
}