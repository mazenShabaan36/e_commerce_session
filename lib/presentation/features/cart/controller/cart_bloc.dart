import 'package:bloc/bloc.dart';
import 'package:session/core/remote/api_constants.dart';
import 'package:session/core/remote/api_service.dart';
import 'package:session/data/models/cart_model.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/cart/controller/cart_event.dart';
import 'package:session/presentation/features/cart/controller/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ApiService apiService = ApiService();
  CartBloc() : super(CartInitial()) {
    on<GetCartEvent>((event, emit) async {
      emit(CartLoading());
      final response = await apiService.get(path: ApiConstants.cartItems);
      //final Cart cart = Cart.fromJsonData(response.data);
      final List<Cart> cart = (response.data as List).map((json) => Cart.fromJson(json)).toList();
      List<Product> cartProducts = await getCartProducts(cart);
      emit(CartLoaded(cartProducts));
    });
    on<IncreaseQuantity>((event, emit) async {
      final currentState = state;
      if (currentState is CartLoaded) {
        final updatedItems = List<Product>.from(currentState.products);
        updatedItems[event.index].quantity++;
        emit(CartLoaded(updatedItems));
      }
    });
    on<DecreaseQuantity>((event, emit) {
      final currentState = state;
      if (currentState is CartLoaded) {
        final updatedItems = List<Product>.from(currentState.products);
        updatedItems[event.index].quantity--;
        emit(CartLoaded(updatedItems));
      }
    });
  }

  Future<List<Product>> getCartProducts(List<Cart> cart) async {
    final productResponse = await apiService.get(path: ApiConstants.products);
    final List<Product> allProducts = (productResponse.data as List).map((json) => Product.fromJson(json)).toList();
    final List<Product> cartProducts =
        cart
            .expand((cart) => cart.products as List)
            .map((cartItem) {
              final product = allProducts.firstWhere((p) => p.id == cartItem.productId, orElse: () => Product(id: null, title: "", price: 0.0, description: "", category: "", image: "", quantity: 0));
              return product.id != null ? Product(id: product.id, title: product.title, price: product.price, description: product.description, category: product.category, image: product.image, quantity: cartItem.quantity) : null;
            })
            .whereType<Product>()
            .toList();
    return cartProducts;
  }
}
