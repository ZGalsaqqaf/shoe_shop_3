// import '../helper/db_helper.dart';
// import '../models/cart_model.dart';
// import '../models/product_model.dart';

// class CartRepository {
//   Future<List<CartModel>> getAll() async {
//     try {
//       await Future.delayed(Duration(seconds: 1));

//       var res = await DbHelper().getAll(DbTables.Categories);
//       List<CartModel> cateList = [];
//       if (res != null) {
//         for (var item in res) {
//           cateList.add(CartModel.fromJson(item));
//         }
//       }
//       return cateList;
//     } catch (e) {
//       rethrow;
//     }
//   } // end getAll

//   Future<int> add(Map<String, dynamic> obj) async {
//     try {
//       var res = await DbHelper().add(DbTables.Categories, obj);
//       return res;
//     } catch (e) {
//       return 0;
//     }
//   } // end add

//   Future<int> delete(int id) async {
//     try {
//       var res = await DbHelper().delete(DbTables.Categories, id);
//       return res;
//     } catch (e) {
//       return 0;
//     }
//   } // end delete

//   Future<CartModel?> getById(int id) async {
//     try {
//       var res = await DbHelper().getById(DbTables.Categories, id);
//       if (res != null) {
//         return CartModel.fromJson(res);
//       }
//       return null;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<int> update(CartModel cart) async {
//     try {
//       var res = await DbHelper().update(DbTables.Categories, cart.toJson());
//       return res;
//     } catch (e) {
//       return 0;
//     }
//   }
// }
