// // dont used
// //////////////// XXXXXXXXXX  ///////////
// //////////////// XXXXXXXXXX  ///////////
// //////////////// XXXXXXXXXX  ///////////
// //////////////// XXXXXXXXXX  ///////////

// import 'package:flutter/material.dart';
// import 'package:shoe_shop_3/widgets/custom_drawer_app_mode.dart';
// import 'package:shoe_shop_3/widgets/search_appbar.dart';

// import '../myclasses/all_categories_classes_and_lists.dart';
// import 'category.dart';

// class AllCategoriesPage extends StatefulWidget {
//   const AllCategoriesPage({super.key, required this.shoeType});
//   final String shoeType;
//   @override
//   State<AllCategoriesPage> createState() => _AllCategoriesPageState();
// }

// class _AllCategoriesPageState extends State<AllCategoriesPage> {
//   IconData appModeIcon = Icons.sunny;

//   void updateAppModeIcon(IconData newIcon) {
//     setState(() {
//       appModeIcon = newIcon;
//     });
//   }
//   List<AllCategoriesClass> getThisCategoryList() {
//     if (widget.shoeType.toLowerCase() == "men") {
//       return menCategoriesList;
//     } else if (widget.shoeType.toLowerCase() == "women") {
//       return womenCategoriesList;
//     } else if (widget.shoeType.toLowerCase() == "boys") {
//       return boyCategoriesList;
//     } else if (widget.shoeType.toLowerCase() == "girls") {
//       return girlCategoriesList;
//     } else {
//       return babyCategoriesList;
//     }
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     List<AllCategoriesClass> thisCategory = getThisCategoryList();

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: SearchAppBar(context),
//       drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
//       body: Container(
//         child: GridView.builder(
//           padding: EdgeInsets.all(16.0),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16.0,
//             mainAxisSpacing: 16.0,
//             childAspectRatio: 0.8, // Adjust the aspect ratio for balanced grids
//           ),
//           itemCount: thisCategory.length,
//           itemBuilder: (BuildContext context, index) {
//             return BaseCategoriesWidget(
//               baseCategory: thisCategory[index],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BaseCategoriesWidget extends StatelessWidget {
//   const BaseCategoriesWidget({super.key, required this.baseCategory});
//   final AllCategoriesClass baseCategory;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100, // Set the desired width
//       height: 100, // Set the desired height
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return CategoryPage();
//           }));
//         },
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: AssetImage(
//                       baseCategory.image), // Set the background image
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(
//                         0.4), // Adjust background image opacity (0.0 to 1.0)
//                     BlendMode.srcOver,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 baseCategory.name,
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
