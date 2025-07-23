import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/managers/alerts_manager.dart';
import 'package:session/presentation/features/home/widgets/home_screen_container_content.dart';
import 'package:session/presentation/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController field = TextEditingController();
  bool isValid = false;
  void poppingFromScreen() {
    ///calculation
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          //
          children: [
            //
            HomeScreenContainerContent(
              //
              title: "UI Widgets: InkWell, ElevatedButton, IconButton",
              subtitle: "These are fundamental Flutter widgets for user interaction.",
              mainColor: AppColors.primary,
              child: Row(
                //
                spacing: 8,
                children: [
                  //
                  Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back1")),
                  Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back2")),
                ],
              ),
            ),

            HomeScreenContainerContent(
              //
              title: "Dialogs, BottomSheets, SnackBars",
              subtitle: "These are common UI patterns for displaying temporary information or collecting input.",
              mainColor: AppColors.red,
              child: Row(
                //
                spacing: 8,
                children: [
                  //
                  Expanded(child: AppButton(onPressed: () => AlertsManager.showLoadingDialog(), title: "show Alert")),
                  Expanded(child: AppButton(onPressed: () => poppingFromScreen(), title: "Back2")),
                ],
              ),
            ),
          ],
          //
        ),
      ),
    );
  }
}
