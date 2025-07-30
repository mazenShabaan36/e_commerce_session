import 'package:session/core/remote/api_keys.dart';

class CartItem {
  final int productId;
  final int quantity;
  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    productId: json[ApiKeys.productId],
    quantity: json[ApiKeys.quantity],
  );
}
