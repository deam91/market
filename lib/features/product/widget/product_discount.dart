import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/product/providers/product_providers.dart';

class ProductDiscount extends ConsumerStatefulWidget {
  const ProductDiscount({super.key, required this.product});

  final Product product;

  @override
  ConsumerState<ProductDiscount> createState() => _ProductDiscountState();
}

class _ProductDiscountState extends ConsumerState<ProductDiscount> {
  double percentSum(List<Offer> offers) {
    return offers
        .map((e) => e.percent_discount ?? 0)
        .reduce((offer, other) => offer + other);
  }

  double priceMinusDiscount(double price, double percent) {
    print('price: $price, discount: $percent%');
    return (min(100-percent, 100) / 100) * price;
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(productOffersProvider(widget.product.offers ?? []));
    return future.when(
      data: (offers) {
        if (offers.isEmpty) {
          return Text(
            'Rs. ${widget.product.price}',
            style: archivoBlack,
          );
        }
        final originalPrice = widget.product.price ?? 0;
        final percent = percentSum(offers);
        final price = priceMinusDiscount(widget.product.price ?? 0, percent);
        final saving = max(originalPrice - price, 0);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('-$percent%', style: archivoRed),
                const SizedBox(width: 5),
                Text(
                  'Rs. ${price.toStringAsFixed(2)}',
                  style: archivoBlack,
                ),
              ],
            ),
            Row(
              children: [
                const Text('M.R.P. : Rs. ', style: archivoBlackSmall),
                Text(
                  '$originalPrice',
                  style: archivoBlackSmall.copyWith(
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            Text(
              '(You are saving Rs.${saving.toStringAsFixed(2)})',
              style: archivoBlackSmall.copyWith(color: const Color(0xff72B01D)),
            ),
          ],
        );
      },
      error: (error, stack) {
        return Text(
          'Rs. ${widget.product.price}',
          style: archivoBlack,
        );
      },
      loading: () {
        return const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 1,
          ),
        );
      },
    );
  }
}
