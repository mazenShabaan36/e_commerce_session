import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/text_styles.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/cart/controller/cart_bloc.dart';
import 'package:session/presentation/features/cart/controller/cart_event.dart';

class QuantityCounterRow extends StatelessWidget {
  const QuantityCounterRow({super.key, required this.index, required this.item});
  final int index;
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<CartBloc>().add(IncreaseQuantity(index));
              },
              child: SvgPicture.asset(AppAssets.plusIcon),
            ),

            //
            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('${item.quantity}', style: Styles.style12mainClrL)),

            //
            GestureDetector(
              onTap: () {
                context.read<CartBloc>().add(DecreaseQuantity(index));
              },
              child: SvgPicture.asset(AppAssets.minusingICon),
            ),
          ],
        ),
        GestureDetector(onTap: () {}, child: SvgPicture.asset(AppAssets.delete)),
      ],
    );
  }
}
