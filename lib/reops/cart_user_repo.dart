import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shoe_shop_3/models/cart_user_model.dart';
import 'package:shoe_shop_3/models/product_model.dart';
import 'package:shoe_shop_3/reops/product_repo.dart';

import '../myclasses/api.dart';

class CartUserRepository {
  late Dio dio;
  String apiLink = cartUserApiLink;
  String apiKey = theApiKey;

  CartUserRepository() {
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 20);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<CartUserModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      var res = await dio.get(
        apiLink,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-apikey': apiKey,
        }),
      );
      List<CartUserModel> items = [];
      if (res.statusCode == 200) {
        var data = res.data as List;
        if (data.isNotEmpty) {
          for (var item in data) {
            items.add(CartUserModel.fromJson(item));
          }
        }
      }
      return items;
    } catch (e) {
      rethrow;
    }
  } // end getAll

  Future<CartUserModel?> getById(String id) async {
    try {
      var res = await dio.get(
        '$apiLink/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (res.statusCode == 200) {
        var data = res.data as Map<String, dynamic>;
        return CartUserModel.fromJson(data);
      } else if (res.statusCode == 404) {
        return null; // Id not found
      } else {
        throw Exception('Failed to fetch audience by id');
      }
    } catch (e) {
      rethrow;
    }
  } // end getById

  Future<List<CartUserModel>> getByField(String field, String value) async {
    try {
      final response = await dio.get(
        apiLink,
        queryParameters: {
          'q': jsonEncode({field: value})
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final carts = <CartUserModel>[];
        for (var cardData in data) {
          carts.add(CartUserModel.fromJson(cardData));
        }
        return carts;
      } else {
        throw Exception('Failed to fetch Category by field');
      }
    } catch (e) {
      rethrow;
    }
  } // end getByField

  Future<List<CartUserModel>> getByFieldWithCheckIsPaid(
    String field,
    String value,
    bool ispaid,
  ) async {
    try {
      final response = await dio.get(
        apiLink,
        queryParameters: {
          'q': jsonEncode({field: value})
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final carts = <CartUserModel>[];
        for (var cardData in data) {
          CartUserModel cart = CartUserModel.fromJson(cardData);
          if (cart.isPaid == ispaid) {
            carts.add(CartUserModel.fromJson(cardData));
          }
        }
        return carts;
      } else {
        throw Exception('Failed to fetch Category by field');
      }
    } catch (e) {
      rethrow;
    }
  } // end getByFieldWithCheckIsPaid

  Future<CartUserModel> addCart(CartUserModel cart) async {
    try {
      final response = await dio.post(
        apiLink,
        data: cart.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 201) {
        var data = response.data as Map<String, dynamic>;
        return CartUserModel.fromJson(data);
      } else {
        throw Exception('Failed to add user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateCart(String id, CartUserModel cart) async {
    try {
      final response = await dio.put(
        '$apiLink/$id',
        data: cart.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data as Map<String, dynamic>;
        return 1;
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> deleteCart(String id) async {
    try {
      final response = await dio.delete(
        '$apiLink/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Cart deleted successfully');
        return 1;
      } else if (response.statusCode == 404) {
        print('Cart not found');
        return 0;
        // throw Exception('Cart not found');
      } else {
        print('Failed to delete cart');
        return -1;
        // throw Exception('Failed to delete cart');
      }
    } catch (e) {
      rethrow;
    }
  } // end deleteCart

  Future<List<CartUserModel>> getUnpaidItems(String userId) async {
    try {
      final response = await dio.get(
        apiLink,
        queryParameters: {
          'q': jsonEncode({'User_id': userId, 'IsPaid': false})
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final unpaidItems = <CartUserModel>[];
        for (var itemData in data) {
          unpaidItems.add(CartUserModel.fromJson(itemData));
        }

        // Update the isPaid field of the retrieved items to true
        for (var item in unpaidItems) {
          item.isPaid = true;
          item.date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          await updateCart(item.id ?? '', item);
        }

        return unpaidItems;
      } else {
        throw Exception('Failed to fetch unpaid items');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<double> countUnpaidItemsPrice(String userId) async {
  //   try {
  //     final response = await dio.get(
  //       apiLink,
  //       queryParameters: {
  //         'q': jsonEncode({'User_id': userId, 'IsPaid': false})
  //       },
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'x-apikey': apiKey,
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       final data = response.data as List<dynamic>;
  //       double totalPrice = 0;
  //       List<Future<Response<dynamic>>> productFutures =
  //           []; // Update the type of productFutures

  //       for (var itemData in data) {
  //         CartUserModel item = CartUserModel.fromJson(itemData);
  //         if (!item.isPaid!) {
  //           Future<Response<dynamic>> productFuture = dio.get(
  //             // Update the type of productFuture
  //             '$productsApiLink/${item.prodId}',
  //             options: Options(
  //               headers: {
  //                 'Content-Type': 'application/json',
  //                 'x-apikey': apiKey,
  //               },
  //             ),
  //           );
  //           productFutures.add(productFuture);
  //         }
  //       }

  //       if (productFutures.isNotEmpty) {
  //         List<Response<dynamic>> productResponses =
  //             await Future.wait(productFutures);

  //         for (var productResponse in productResponses) {
  //           if (productResponse.statusCode == 200) {
  //             final productData = productResponse.data as Map<String, dynamic>;
  //             final product = ProductShoeModel.fromJson(productData);
  //             totalPrice += product.price ?? 0;
  //           }
  //         }
  //       }

  //       return totalPrice;
  //     } else {
  //       throw Exception('Failed to fetch unpaid items');
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<double> calculateTotalPrice(List<CartUserModel> items) async {
  //   double totalPrice = 0.0;

  //   for (var item in items) {
  //     ProductShoeModel? product =
  //         await ProductShoeRepository().getById(item.prodId ?? '');
  //     if (product != null && product.price != null && item.numPieces != null) {
  //       totalPrice += product.price! * item.numPieces!;
  //     }
  //   }

  //   return totalPrice;
  // }

  Future<double> getTotalPriceOfUnpaidItems(String userId) async {
    try {
      final unpaidItems =
          await getByFieldWithCheckIsPaid('User_id', userId, false);
      double totalPrice = 0;

      for (var item in unpaidItems) {
        final product =
            await ProductShoeRepository().getById(item.prodId ?? '');
        if (product != null) {
          totalPrice += product.price! * item.numPieces!;
        }
      }

      return totalPrice;
    } catch (e) {
      throw Exception('Failed to calculate total price of unpaid items');
    }
  }
}
