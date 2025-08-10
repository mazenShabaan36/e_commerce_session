import 'package:hive/hive.dart';
import 'package:session/core/remote/api_keys.dart';
import 'package:session/data/models/cart_item.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class Cart {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final List<CartItem> products;

  Cart({required this.id, required this.date, required this.userId, required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(id: json[ApiKeys.id], userId: json[ApiKeys.userID], date: DateTime.parse(json[ApiKeys.date]), products: List<CartItem>.from(json[ApiKeys.products].map((x) => CartItem.fromJson(x))));
  }
}
