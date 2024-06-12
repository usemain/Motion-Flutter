import 'package:motion/configs/index.dart';
import 'package:motion/controller/sysController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/customScaffold.dart';
import '../../configs/data.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final SysController sysController = Get.find();

  void setTheme(String type) async {
    if (type != sysController.theme.value) {
      Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
      (await SharedPreferences.getInstance())
          .setString('Theme', Get.isDarkMode ? 'Light' : 'Dark');
      sysController.setTheme(Get.isDarkMode ? 'Light'.obs : 'Dark'.obs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '主题',
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Obx(() => Column(
              children: items.map((item) {
                bool isTheme = sysController.theme.value == item['type'];
                return GestureDetector(
                  onTap: () => setTheme(item['type']),
                  child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: isTheme
                          ? const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [commonColorDefault, commonColor],
                            )
                          : null,
                      border: isTheme
                          ? null
                          : Border.all(color: commonColorDefault),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(item['title'],
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'alimama',
                            color:
                                isTheme ? Colors.white : commonColorDefault)),
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
