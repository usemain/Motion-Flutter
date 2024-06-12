import 'package:motion/widgets/customScaffold.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> cartNums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    List<Cart> carts() {
      return cartNums.map((index) => Cart(index: index)).toList();
    }

    return CustomScaffold(
        title: '详情',
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: carts().length,
            itemBuilder: (_, index) => carts()[index],
          ),
        ));
  }
}
