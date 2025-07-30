import 'package:session/core/remote/api_constants.dart';
import 'package:session/core/remote/api_service.dart';
import 'package:session/data/models/cart_model.dart';

class CartController {
  final ApiService apiService = ApiService();

  Future<List<Cart>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.carts);
      final List<dynamic> dataList = response.data as List;
      // debugPrint(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        return dataList.map((e) => Cart.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow; // == throw(e)
    }
  }
}
