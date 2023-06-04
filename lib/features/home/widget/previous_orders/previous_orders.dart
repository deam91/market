import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/core/router/router.dart';
import 'package:market/core/widgets/list_item.dart';
import 'package:market/features/home/providers/home_providers.dart';
import 'package:market/features/home/widget/text_header.dart';

class PreviousOrders extends ConsumerWidget {
  const PreviousOrders({this.headerTitle = 'My Previous Orders', super.key});

  final String headerTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(ordersStream);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextHeader(text: headerTitle),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.expand(height: 105),
          child: stream.when(
            data: (data) {
              if (data == null || data.size == 0) {
                return const Center(child: Text('No previous orders founded'));
              }
              final products = data.docs.map((e) => e.data()).toList();
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return ListItem(
                    onTap: () {
                      context.router
                          .push(ProductRoute(product: products[index]));
                    },
                    item: products[index],
                  );
                },
              );
            },
            error: (error, stack) {
              return Center(child: Text(error.toString()));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
