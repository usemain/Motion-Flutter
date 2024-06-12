import 'dart:ui';

import 'package:motion/controller/sysController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/data.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int currentIndex = 0;
  final SysController sysController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          ClipRect(child: Obx(() => buildBlurryNavigationBar())),
      body: IndexedStack(
        index: currentIndex,
        children: tabBarPages,
      ),
    );
  }

  Widget buildBlurryNavigationBar() {
    Color bgColor = sysController.theme.value == "Dark"
        ? const Color(0xFF1c1b1f).withOpacity(0.4)
        : Colors.white.withOpacity(0.4);
    Color txtColor = sysController.theme.value == "Dark"
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF1C1B1F);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
      child: Container(
        height: 70 + MediaQuery.of(context).padding.bottom,
        color: bgColor,
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            iconSize: 25,
            unselectedFontSize: 9,
            selectedFontSize: 9,
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: txtColor.withOpacity(0.6),
            selectedItemColor: txtColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: buildTabBarItems(),
          ),
        ),
      ),
    );
  }
}
