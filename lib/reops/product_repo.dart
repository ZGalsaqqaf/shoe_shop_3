import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shoe_shop_3/models/product_model.dart';


class ProductShoeRepository {
  late Dio dio;
  String apiLink = 'https://shoes-0c15.restdb.io/rest/product';
  String apiKey = "3d7f9c333161d9fb62ff9fe040ced9ca4cc16";

  ProductShoeRepository() {
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 20);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<ProductShoeModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      var res = await dio.get(
        apiLink,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-apikey': apiKey,
        }),
      );
      List<ProductShoeModel> items = [];
      if (res.statusCode == 200) {
        var data = res.data as List;
        if (data.isNotEmpty) {
          for (var item in data) {
            items.add(ProductShoeModel.fromJson(item));
          }
        }
      }

      return items;
    } catch (e) {
      rethrow;
    }
  } // end getAll

  Future<ProductShoeModel?> getById(String id) async {
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
        return ProductShoeModel.fromJson(data);
      } else if (res.statusCode == 404) {
        return null; // Id not found
      } else {
        throw Exception('Failed to fetch audience by id');
      }
    } catch (e) {
      rethrow;
    }
  } // end getById

  Future<List<ProductShoeModel>> getByField(String field, String value) async {
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
        final audiences = <ProductShoeModel>[];
        for (var audienceData in data) {
          audiences.add(ProductShoeModel.fromJson(audienceData));
        }
        return audiences;
      } else {
        throw Exception('Failed to fetch audience by field');
      }
    } catch (e) {
      rethrow;
    }
  } // end getByField

  Future<List<ProductShoeModel>> getByField2(
      String field, String value, String fieldName1,
      {String value2 = "", String fieldName2 = ""}) async {
    try {
      final response = await dio.get(
        apiLink,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final products = <ProductShoeModel>[];
        for (var productData in data) {
          final product = ProductShoeModel.fromJson(productData);

          // Check if the product's category name matches the provided value
          if (product.cateId != null && product.cateId!.isNotEmpty) {
            for (var category in product.cateId!) {
              if (category[fieldName1] == value) {
                products.add(product);
                break;
              }
            }
          }
        }
        return products;
      } else {
        throw Exception('Failed to fetch products by field');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductShoeModel>> getByCateNameAndAudienceName(
      String value1, String value2) async {
    try {
      final response = await dio.get(
        apiLink,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-apikey': apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final products = <ProductShoeModel>[];

        for (var productData in data) {
          final product = ProductShoeModel.fromJson(productData);

          // Check if the product's category name matches the provided value1
          if (product.cateId != null && product.cateId!.isNotEmpty) {
            bool categoryMatched = false;
            for (var categoryId in product.cateId!) {
              if (categoryId['Name'] == value1) {
                categoryMatched = true;
                break;
              }
            }
            if (!categoryMatched) {
              continue; // Skip to the next product if the category didn't match
            }
          }

          // Check if the product's audience name matches the provided value2
          if (product.audiId != null && product.audiId!.isNotEmpty) {
            bool audienceMatched = false;
            for (var audienceId in product.audiId!) {
              if (audienceId['Name'] == value2) {
                audienceMatched = true;
                break;
              }
            }
            if (!audienceMatched) {
              continue; // Skip to the next product if the audience didn't match
            }
          }

          products.add(product);
        }

        return products;
      } else {
        throw Exception('Failed to fetch products by field');
      }
    } catch (e) {
      rethrow;
    }
  }
}
