import 'package:flutter/material.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/product/widget/details_list/bullet_list_item.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({required this.list, super.key});

  final List<ProductDetail> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: list
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: BulletListItem(
                title: e.title ?? '',
                description: e.description ?? '',
              ),
            ),
          )
          .toList(),
    );
  }
}
