import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sysController.dart';

enum ToastType {
  error,
  info,
  success,
}

class Toast {
  static void show({
    String title = '提示',
    required String message,
    ToastType type = ToastType.success,
  }) {
    final SysController sysController = Get.find();

    Icon icon;
    switch (type) {
      case ToastType.error:
        icon = const Icon(Icons.cancel, color: Color(0xFFFF5252));
        break;
      case ToastType.info:
        icon = const Icon(Icons.info, color: Color(0xFFABABAB));
        break;
      case ToastType.success:
      default:
        icon = const Icon(Icons.check_circle, color: Color(0xFF3BD95C));
    }

    Get.snackbar(
      title,
      message,
      colorText:
          sysController.theme.value == 'Dark' ? Colors.white : Colors.black,
      duration: const Duration(milliseconds: 2000),
      icon: icon,
      backgroundColor: sysController.theme.value == 'Dark'
          ? const Color.fromRGBO(0, 0, 0, 0.3)
          : const Color.fromRGBO(223, 223, 223, 0.3),
      shouldIconPulse: false,
      borderRadius: 10.0,
      animationDuration: const Duration(milliseconds: 400),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOut,
    );
  }
}
