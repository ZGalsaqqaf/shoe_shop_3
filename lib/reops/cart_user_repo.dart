import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shoe_shop_3/models/cart_user_model.dart';

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
  } // end getByField

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
  }
}
