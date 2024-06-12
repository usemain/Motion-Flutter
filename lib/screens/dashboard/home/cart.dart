import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../configs/index.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey("$index"),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [commonColorDefault, commonColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Item',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontFamily: 'alimama',
          ),
        ),
      ),
    );
  }
}
