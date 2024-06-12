import 'package:flutter/material.dart';
import 'package:motion/configs/index.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final double titleSize;
  final double iconSize;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.titleSize = commonTitleSize,
    this.iconSize = commonIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: commonColorDefault,
            fontSize: titleSize,
            fontFamily: 'alimama',
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: iconSize,
          ),
        ),
      ),
      body: body,
    );
  }
}
