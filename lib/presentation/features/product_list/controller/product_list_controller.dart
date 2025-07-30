import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:session/core/remote/api_constants.dart';
import 'package:session/core/remote/api_service.dart';
import 'package:session/data/models/product_model.dart';

class ProductListController {
  final ApiService apiService = ApiService();

  Future<List<Product>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.products);
      // debugPrint(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        return response.data.map((e) => Product.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow; // == throw(e)
    }
  }
}
