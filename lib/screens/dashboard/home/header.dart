import 'package:motion/configs/index.dart';
import 'package:motion/controller/sysController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({super.key});

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  final SysController sysController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          'Hello!  easy',
                          style: TextStyle(
                            color: commonColorDefault,
                            fontFamily: 'alimama',
                            fontSize: 15,
                          ),
                        )),
                    Text(
                      '今日目标还未完成!',
                      style: TextStyle(
                        color: Color(0xFF959595),
                        fontSize: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/Details'),
              child: ClipOval(
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/images/head.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
