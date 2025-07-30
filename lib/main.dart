import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/theme/app_themes.dart';
import 'package:session/core/theme/theme_manager.dart';
import 'package:session/presentation/features/auth/view/login_screen.dart';
import 'package:session/presentation/features/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// to get current context from any where
final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();
BuildContext get appContext => appKey.currentContext!;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',

          //
          theme: AppThemes.lightTheme,

          darkTheme: AppThemes.darkTheme,
          themeMode: value,
          //
          home: LoginScreen(),
          navigatorKey: appKey,
        );
      },
    );
  }
}
