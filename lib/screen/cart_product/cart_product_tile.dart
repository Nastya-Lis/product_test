import 'package:example/screen/cart_product/bloc/cart_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/model/product.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: Image.network(product.thumbnail),
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text("${product.price} \$"),
      trailing: SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                alignment: Alignment.center,
                iconSize: 15,
                onPressed: () {
                  context.read<CartProductBloc>().add(
                      ChangeQuantityCartProductEvent(
                          quantityChange: QuantityChange.decrease,
                          product: product));
                },
                icon: const Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
            Text(
              product.quantity.toString(),
              style: const TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                iconSize: 15,
                onPressed: () {
                  context.read<CartProductBloc>().add(
                      ChangeQuantityCartProductEvent(
                          quantityChange: QuantityChange.increase,
                          product: product));
                },
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
