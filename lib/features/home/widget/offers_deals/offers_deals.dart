import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/core/widgets/list_item.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/providers/home_providers.dart';
import 'package:market/features/home/widget/text_header.dart';

class OffersAndDeals extends ConsumerWidget {
  const OffersAndDeals({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(offersStream);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextHeader(text: 'My Offers & Deals'),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.expand(height: 105),
          child: stream.when(
            data: (data) {
              if (data == null || data.size == 0) {
                return const Center(child: Text('No offers or deals founded'));
              }
              final offers = data.docs.map((e) => e.data()).toList();
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    onTap: () {},
                    item: offers[index],
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
