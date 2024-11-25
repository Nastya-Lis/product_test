import 'package:example/network/model/product.dart';
import 'package:example/router.dart';
import 'package:example/screen/list_product/bloc/list_product_bloc.dart';
import 'package:example/screen/list_product/product_tile.dart';
import 'package:example/screen/reusable_widget/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products App"),
      ),
      body: BlocBuilder<ListProductBloc, ListProductState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ProductTile(product: state.products[index]),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavbar(
          cartFunc: () async {
            await context.push(AppRoutes.productCart.path).then((_) =>
                context.read<ListProductBloc>().add(InitListProductEvent()));
          },
          homeFunc: () {}),
    );
  }
}
