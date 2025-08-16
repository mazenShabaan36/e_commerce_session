import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/core/text_styles.dart';
import 'package:session/presentation/features/cart/controller/cart_bloc.dart';
import 'package:session/presentation/features/cart/controller/cart_event.dart';
import 'package:session/presentation/features/cart/controller/cart_state.dart';
import 'package:session/presentation/features/cart/view/widgets/cart_item_card.dart';
import 'package:session/presentation/features/cart/view/widgets/checkout_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(GetCartEvent()),
      child: Scaffold(
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
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.products.length,
                      separatorBuilder: (context, index) => SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return CartItemCard(item: product, index: index);
                      },
                    ),
                  ),
                  CheckOutSection(state: state),
                ],
              );
            } else if (state is CartError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
