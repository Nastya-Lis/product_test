import 'package:example/screen/cart_product/bloc/cart_product_bloc.dart';
import 'package:example/screen/cart_product/cart_product_list.dart';
import 'package:example/screen/list_product/bloc/list_product_bloc.dart';
import 'package:example/screen/list_product/product_list.dart';
import 'package:example/screen/product_card/bloc/product_card_bloc.dart';
import 'package:example/screen/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'network/model/product.dart';

enum AppRoutes {
  listScreen("/"),
  productCardScreen("/product_card_screen"),
  productCart("/product_cart");

  final String path;

  const AppRoutes(this.path);
}

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: AppRoutes.listScreen.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: BlocProvider<ListProductBloc>(
          create: (context) => ListProductBloc()..add(InitListProductEvent()),
          child: const ProductList(),
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
  GoRoute(
    path: AppRoutes.productCardScreen.path,
    pageBuilder: (context, state) {
      Product product = state.extra as Product;
      return CustomTransitionPage(
        child: BlocProvider<ProductCardBloc>(
          create: (context) => ProductCardBloc()..add(InitProductCardEvent(product: product)),
          child: const ProductCard(),
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
  GoRoute(
    path: AppRoutes.productCart.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: BlocProvider<CartProductBloc>(
          create: (context) => CartProductBloc()..add(InitCartProductEvent()),
          child: const CartProductList(),
        ),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return child;
        },
      );
    },
  ),
]);
