import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/presentation/features/cart/controller/cart_state.dart';
import 'package:session/presentation/features/cart/view/widgets/build_summary_row.dart';
import 'package:session/presentation/features/cart/view/widgets/custom_dashed_line.dart';
import 'package:session/presentation/widgets/app_button.dart';

class CheckOutSection extends StatelessWidget {
  const CheckOutSection({super.key, required this.state});
  final CartLoaded state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          BuildSummaryRow(title: AppStrings.subtotal, value: "\$${state.subTotal}"),
          //
          BuildSummaryRow(title: AppStrings.shipping, value: "\$${state.shipping}"),
          //
          const CustomDashedLine(),
          //
          BuildSummaryRow(title: AppStrings.total, value: "\$${state.total}"), const SizedBox(height: 16),
          //
          AppButton(title: AppStrings.checkOut, onPressed: () {}, backgroundColor: AppColors.mainColor, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
