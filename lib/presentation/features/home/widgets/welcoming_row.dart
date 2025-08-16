import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/presentation/features/cart/view/cart_screen.dart';

import 'welcome_column.dart';

class WelcomingRow extends StatelessWidget {
  const WelcomingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const WelcomeColumn(),
        //
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: SvgPicture.asset(AppAssets.bag),
        ),
      ],
    );
  }
}
