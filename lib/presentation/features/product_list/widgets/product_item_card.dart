import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/product_list/view/product_details_screen.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => ProductDetailsScreen(product: product),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: SlideTransition(position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation), child: child));
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.white),
        child: Row(
          spacing: 16,
          children: [
            //
            Hero(
              tag: product.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                //
                child: Image.asset(product.image, width: 120, height: 120, fit: BoxFit.cover),
              ),
            ),

            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                //
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
