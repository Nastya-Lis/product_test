import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.cartFunc,
    required this.homeFunc,
    required this.itemCartCount,
  });

  final Function cartFunc;
  final Function homeFunc;
  final int itemCartCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
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
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints:
                          const BoxConstraints(minHeight: 12, minWidth: 12),
                      child: Text(
                        itemCartCount.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 8),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
