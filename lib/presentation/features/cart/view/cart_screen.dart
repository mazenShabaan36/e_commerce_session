import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/data/models/cart_model.dart';
import 'package:session/presentation/features/cart/controller/cart_controller.dart';
import 'package:session/presentation/features/product_list/widgets/product_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = CartController();

  bool isLoading = true;
  List<Cart> carts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await cartController.getProducts();

    setState(() {
      carts = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.cart)),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: carts.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final cart = carts[index];
                          return ExpansionTile(
                            backgroundColor: AppColors.white,
                            collapsedBackgroundColor: AppColors.white,
                            title: Text(
                              'Cart #${cart.id} (User ${cart.userId})',
                            ),
                            subtitle: Text(
                              'Date: ${cart.date.toLocal().toIso8601String().split("T")[0]}',
                            ),
                            children:
                                cart.products.map((item) {
                                  return ListTile(
                                    title: Text(
                                      'Product ID: ${item.productId}',
                                    ),
                                    trailing: Text('Qty: ${item.quantity}'),
                                  );
                                }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
