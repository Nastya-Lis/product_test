import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.cartFunc,
    required this.homeFunc,
  });

  final Function cartFunc;
  final Function homeFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(offset: Offset(0, 60), blurRadius: 20),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                homeFunc();
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                cartFunc();
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}
