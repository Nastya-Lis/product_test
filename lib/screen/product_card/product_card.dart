import 'package:example/constants.dart';
import 'package:example/screen/product_card/bloc/product_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardBloc, ProductCardState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(cardScreen),
        ),
        body: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                state.product != null
                    ? Expanded(
                        child: state.product?.images == null
                            ? const SizedBox(
                                child: Icon(Icons.no_photography),
                              )
                            : CarouselView(
                                itemExtent: MediaQuery.of(context).size.width *
                                    (state.product!.images!.length > 1
                                        ? 0.75
                                        : 1),
                                children: List.generate(
                                  state.product!.images!.length,
                                  (index) => Image.network(
                                    state.product!.images![index],
                                    errorBuilder: (context, error, trace) {
                                      return const Icon(Icons.no_photography);
                                    },
                                  ),
                                ),
                              ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.product?.title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        state.product?.description ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text("${state.product?.price} \$"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(offset: Offset(0, 60), blurRadius: 20),
              ]),
          child: ElevatedButton(
              onPressed: state.isExistInCart
                  ? null
                  : () {
                      context
                          .read<ProductCardBloc>()
                          .add(AddProductToCardEvent());
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text(
                state.isExistInCart ? addedText : addToCartText,
                style: const TextStyle(color: Colors.white),
              )),
        ),
      );
    });
  }
}
