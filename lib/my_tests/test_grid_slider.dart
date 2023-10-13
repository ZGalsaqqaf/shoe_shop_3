import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      body: Column(
        children: [
          Container(
            color: Colors.blue[100],
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle button 1 press
                  },
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 2 press
                  },
                  child: Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text('Button 3'),
                ),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.8,
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                print("=== image index : $index === Reason of change: ${reason.name}");
              },
              enlargeCenterPage: true,
            ),
            items: [
              "women/sneakers/wsk1.jpg",
              "men/dress/md1.jpg",
              "women/heels/ws1.jpg",
              "children/sandals/ks1.jpg"
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromARGB(37, 0, 0, 0),
                        width: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Image.asset("assets/images/$i"),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.6,
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
          ),
        ],
      ),
    );
  }
}