import 'package:session/data/models/product_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<Product> products;
  CartLoaded(this.products);
  double get subTotal => products.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get shipping => 0.0;
  double get total => subTotal + shipping;
}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}
