import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/core/text_styles.dart';
import 'package:session/data/models/cart_model.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/cart/controller/cart_controller.dart';
import 'package:session/presentation/features/cart/view/widgets/cart_item_card.dart';
import 'package:session/presentation/features/cart/view/widgets/checkout_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = CartController();

  bool isLoading = true;
  List<Cart> carts = [];
  List<Product> products = [];

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
    });
    final results2 = await cartController.getCartProducts(carts);
    setState(() {
      products = results2;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.cart, style: Styles.style16mainClrL),
        backgroundColor: AppColors.colorWhiteLight,
        foregroundColor: AppColors.mainColor,
        elevation: 0,
        leadingWidth: 40,
        //
        leading: GestureDetector(
          onTap: () {},
          //
          child: SvgPicture.asset(
            AppAssets.arrowBackIcon,
            //
            color: AppColors.mainColor,
            height: 20,
            width: 20,
          ),
        ),
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: products.length,
                      separatorBuilder: (context, index) => SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return CartItemCard(item: product, index: index);
                      },
                    ),
                  ),
                  CheckOutSection(),
                ],
              ),
    );
  }
}
