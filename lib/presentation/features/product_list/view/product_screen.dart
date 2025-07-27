import 'package:flutter/material.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/core/theme/theme_manager.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/product_list/view/product_details_screen.dart';
import 'package:session/presentation/features/product_list/widgets/product_item_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final List<Product> products = [
    Product(name: 'Pizza', image: AppAssets.pizza, price: 12.99),
    //
    Product(name: 'Burger', image: AppAssets.burger, price: 8.99),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ThemeManager.themeNotifier.value == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.products),
        actions: [
          //
          Switch(
            value: isDarkMode,
            //
            onChanged: (value) => ThemeManager.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (context, index) => SizedBox(height: 16),
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
