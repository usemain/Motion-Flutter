import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SysController extends GetxController {
  RxString theme = "".obs;

  SysController(this.theme);

  // 设置主题值
  setTheme(RxString value) {
    theme.value = value.value;
    theme.update(value.call);
  }
}
