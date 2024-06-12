import 'package:motion/configs/index.dart';
import 'package:motion/controller/sysController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/data.dart';

class WeekPage extends StatefulWidget {
  final int active;
  final Function(int) onWeekChange;

  const WeekPage({super.key, required this.active, required this.onWeekChange});

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  final SysController sysController = Get.find();
  late List<Map<String, dynamic>> weekData;
  late DateTime now = DateTime.now();
  late int currentWeekday = now.weekday;
  late DateTime startOfWeek = now.subtract(Duration(days: currentWeekday - 1));

  DateTime currentDay(int index) {
    return startOfWeek.add(Duration(days: index));
  }

  bool isToday(int index) {
    return currentDay(index).day == now.day &&
        currentDay(index).month == now.month &&
        currentDay(index).year == now.year;
  }

  @override
  void initState() {
    super.initState();
    weekData = getCurrentWeekDays();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int index = 0; index < weekMap.length; index++) {
        if (isToday(index)) {
          widget.onWeekChange(index);
          break;
        }
      }
    });
  }

  List<Map<String, dynamic>> getCurrentWeekDays() {
    return List.generate(weekMap.length, (index) {
      return {
        'week': '周${weekMap[index]}',
        'date': isToday(index) ? '今' : currentDay(index).day,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: weekData.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> day = entry.value;
        bool isActive = index == widget.active;
        return Expanded(
          child: GestureDetector(
            onTap: () => widget.onWeekChange(index),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: isActive
                    ? const LinearGradient(
                        colors: [commonColorDefault, commonColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Obx(() {
                  bool isDarkTheme = sysController.theme.value == 'Dark';
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${day['date']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isActive
                              ? isDarkTheme
                                  ? Colors.black
                                  : Colors.white
                              : null,
                        ),
                      ),
                      Text(
                        day['week'],
                        style: TextStyle(
                          fontSize: 10,
                          color: isActive
                              ? isDarkTheme
                                  ? const Color(0xFF393939)
                                  : const Color(0xFFF1F1F1)
                              : const Color(0xFF959595),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
