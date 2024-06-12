import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AndroidBackTop {
  // 设置退出到手机桌面
  static MethodChannel platform = const MethodChannel('motion/messageChannel');

  static Future<bool> backDeskTop() async {
    try {
      await platform.invokeMethod('backDesktop');
      return Future.value(true);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("通信失败${e.message}");
      }
      SystemNavigator.pop();
      return Future.value(false);
    }
  }
}

