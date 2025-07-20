import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/presentation/features/auth/view/login_screen.dart';
import 'package:session/presentation/features/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      //
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          hintStyle: TextStyle(fontSize: 14, color: AppColors.grey, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.grey), borderRadius: BorderRadius.circular(8)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.grey.withAlpha(50)), borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary), borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5, color: AppColors.red)),
          suffixIconColor: AppColors.grey,
          prefixIconColor: AppColors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:
          //
          ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primary),
            //
            foregroundColor: WidgetStateProperty.all(AppColors.black),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                //
              ),
            ),
            textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
      //
      home: LoginScreen(),
    );
  }
}
