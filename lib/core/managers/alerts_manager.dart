import 'package:flutter/material.dart';
import 'package:session/main.dart';

class AlertsManager {
  static Future<T> showAppDialog<T>({required Widget child, Color? barrierColor, bool barrierDismissible = true}) async {
    return await showDialog(
      //
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder:
          (builder) => Dialog(
            //
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: const EdgeInsets.all(16),
            child: child,
          ),
    );
  }

  static Future<T?> showAppGeneralDialog<T>({Color? barrierColor, bool barrierDismissible = true, required Widget child, double finalScale = 1}) async {
    return await showGeneralDialog<T>(
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor!,
      transitionBuilder: (context, animation, secondaryAnimation, dialogChild) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);

        return ScaleTransition(scale: Tween<double>(begin: 0.2, end: finalScale).animate(curvedAnimation), child: FadeTransition(opacity: Tween<double>(begin: 0.5, end: 1).animate(curvedAnimation), child: dialogChild));
      },

      pageBuilder: (context, animation, secondaryAnimation) => SafeArea(child: Center(child: Material(child: child))),
    );
  }

  static Future<void> showLoadingDialog() async {
    await showAppDialog(barrierDismissible: false, child: const CircularProgressIndicator());
  }
}
