import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/data.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, left: 15, right: 15),
        child: Column(
          children: myMenus.map((item) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed('/Theme');
              },
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Icon(
                            item['icon'],
                            size: 17,
                          ),
                        ),
                        Text(
                          item['title'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
