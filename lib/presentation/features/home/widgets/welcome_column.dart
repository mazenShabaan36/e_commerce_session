import 'package:flutter/material.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/core/text_styles.dart';

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Text(AppStrings.welcome, style: Styles.style10greyM),
        //
        const SizedBox(height: 4),
        //
        Text(AppStrings.falconThoghts, style: Styles.style12mainClrL),
      ],
    );
  }
}
