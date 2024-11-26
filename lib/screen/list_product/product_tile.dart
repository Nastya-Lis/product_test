import 'package:example/network/model/product.dart';
import 'package:example/router.dart';
import 'package:example/screen/list_product/bloc/list_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productCardScreen.path, extra: product);
      },
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8),
        elevation: 4.0,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                product.thumbnail,
                errorBuilder: (context, error, trace) {
                  return const Icon(Icons.no_photography);
                },
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              "${product.price} \$",
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<ListProductBloc>()
                    .add(AddToCartListProductEvent(product: product));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: const Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
