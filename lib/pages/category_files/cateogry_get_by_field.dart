// // Get Categories of Each Audience ==> Sneakers, Heels, Boots, ....

// import 'package:flutter/material.dart';
// import 'package:shoe_shop_3/models/category_model.dart';
// import 'package:shoe_shop_3/pages/category_files/products_audience.dart';
// import 'package:shoe_shop_3/reops/category_repo.dart';

// import '../../widgets/custom_drawer_app_mode.dart';
// import '../../widgets/search_appbar.dart';

// class CategoryGetByField extends StatefulWidget {
//   const CategoryGetByField(
//       {super.key, required this.field, required this.value});
//   final String field;
//   final String value;

//   @override
//   State<CategoryGetByField> createState() => _CategoryGetByFieldState();
// }

// class _CategoryGetByFieldState extends State<CategoryGetByField> {
//   IconData appModeIcon = Icons.sunny;

//   void updateAppModeIcon(IconData newIcon) {
//     setState(() {
//       appModeIcon = newIcon;
//     });
//   }

//   Future<List<CategoryModel>>? _categoryData;

//   @override
//   void initState() {
//     super.initState();
//     _categoryData = _fetchcategoryData();
//   }

//   Future<List<CategoryModel>> _fetchcategoryData() async {
//     final repository = CategoryRepository();
//     return repository.getByField(widget.field, widget.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: SearchAppBar(context),
//       drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
//       body: FutureBuilder<List<CategoryModel>>(
//         future: _categoryData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final categories = snapshot.data;
//             if (categories == null || categories.isEmpty) {
//               return Text('No category data found.');
//             } else {
//               return GridView.count(
//                 crossAxisCount: 3, // Display three items in each line
//                 padding: EdgeInsets.all(10.0),
//                 mainAxisSpacing: 16.0,
//                 crossAxisSpacing: 16.0,
//                 children: List.generate(categories.length, (index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                       //   return ProductAudience(
//                       //     value1: '${categories[index].name}',
//                       //     value2: '${categories[index].audience}',
//                       //   );
//                       // }));
//                       print(
//                           '===========image : ${categories[index].image ?? ''}');
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         image: DecorationImage(
//                           image: NetworkImage(categories[index].image ?? ''),
//                           fit: BoxFit.cover,
//                           colorFilter: ColorFilter.mode(
//                             Colors.black.withOpacity(
//                                 0.4), // Adjust background image opacity (0.0 to 1.0)
//                             BlendMode.darken, // Apply a dark overlay
//                           ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 2.0, vertical: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Icon(
//                             //   baseCategory.icon,
//                             //   size: 32,
//                             //   color: Colors.white,
//                             // ),
//                             Text(
//                               '${categories[index].name}',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }
