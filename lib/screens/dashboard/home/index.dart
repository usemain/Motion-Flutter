import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'header.dart';
import 'progress.dart';
import 'overview.dart';
import 'week.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int active = -1;
  final List<int> cartNums = [0, 1, 2, 3, 4, 5];

  void onWeekChange(int value) {
    setState(() => active = value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          left: 15, right: 15, bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          const HeaderPage(),
          const ProgressPage(),
          const OverViewPage(),
          WeekPage(active: active, onWeekChange: onWeekChange),
          SlidableAutoCloseBehavior(
            child: Column(
              children: [
                ...cartNums.map((index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/Details');
                        },
                        child: Cart(
                          index: index,
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
