import 'package:flutter/material.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/widgets/app_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Hero(
              tag: product.id,
              child: Image.asset(product.image, width: 200),
            ), //

            SizedBox(height: 20),
            //
            Text(
              product.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            //
            SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            //
            SizedBox(height: 20),
            //
            AppButton(onPressed: () {}, title: AppStrings.buyNow),
          ],
        ),
      ),
    );
  }
}
