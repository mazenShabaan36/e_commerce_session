sealed class CartEvent {}

class GetCartEvent extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final int index;
  IncreaseQuantity(this.index);
}

class DecreaseQuantity extends CartEvent {
  final int index;
  DecreaseQuantity(this.index);
}

class RemoveProduct extends CartEvent {
  final int index;
  RemoveProduct(this.index);
}
