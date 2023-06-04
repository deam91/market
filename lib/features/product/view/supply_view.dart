import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/widget/previous_orders/previous_orders.dart';
import 'package:market/features/home/widget/text_header.dart';
import 'package:market/features/product/providers/product_providers.dart';
import 'package:market/features/product/widget/counter.dart';
import 'package:market/features/product/widget/product_discount.dart';
import 'package:market/features/product/widget/product_panel.dart';
import 'package:market/features/product/widget/product_panel_link.dart';
import 'package:market/features/product/widget/supply_step.dart';

@RoutePage()
class SupplyView extends ConsumerWidget {
  const SupplyView({required this.supplies, super.key});

  final List<SupplyDetail> supplies;

  static const routeName = '/supplies';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextHeader(text: 'Supply Details'),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              padding: const EdgeInsets.all(24),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(supplies[index].title ?? '', style: archivoBlack),
                    ...(supplies[index].steps ?? []).mapIndexed((i, e) {
                      return SupplyStepItem(step: e, index: i);
                    }),
                  ],
                );
              },
              itemCount: supplies.length,
            ),
          ),
        ],
      ),
    );
  }
}
