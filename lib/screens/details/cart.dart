import 'package:motion/configs/index.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [commonColorDefault, commonColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Item',
        style:
            TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'alimama'),
      ),
    );
  }
}
