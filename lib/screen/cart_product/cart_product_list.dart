import 'package:example/screen/cart_product/bloc/cart_product_bloc.dart';
import 'package:example/screen/cart_product/cart_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../router.dart';
import '../reusable_widget/custom_bottom_navbar.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductBloc, CartProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(cartScreen),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.productsCart?.length,
                  itemBuilder: (context, index) {
                    return state.productsCart != null
                        ? CartProductTile(product: state.productsCart![index])
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavbar(
            cartFunc: () {
              context.push(AppRoutes.productCart.path);
            },
            homeFunc: () {
              context.pushReplacement(AppRoutes.listScreen.path);
            },
            itemCartCount: state.itemCartCount,
          ),
        );
      },
    );
  }
}
