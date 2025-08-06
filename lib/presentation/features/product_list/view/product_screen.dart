import 'package:flutter/material.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/core/theme/theme_manager.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/cart/view/cart_screen.dart';
import 'package:session/presentation/features/product_list/controller/product_list_controller.dart';
import 'package:session/presentation/features/product_list/view/product_details_screen.dart';
import 'package:session/presentation/features/product_list/widgets/product_item_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductListController productListController = ProductListController();

  bool isLoading = true;
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await productListController.getProducts();

    setState(() {
      products = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ThemeManager.themeNotifier.value == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.products),
        actions: [
          //
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_bag),
          ),
          // Switch(
          //   value: isDarkMode,
          //   //
          //   onChanged: (value) => ThemeManager.toggleTheme(),
          // ),
        ],
      ),
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
                        itemCount: products.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductItemCard(product: product);
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
