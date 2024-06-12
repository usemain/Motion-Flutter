import 'package:motion/controller/sysController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/progress/circle.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final SysController sysController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Obx(() => ProgressCircle(
            progress: 73.81,
            backgroundColor: sysController.theme.value == 'Dark'
                ? const Color(0xFF252525)
                : const Color(0xFFF3F3F3),
          )),
    );
  }
}
