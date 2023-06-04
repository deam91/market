import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/widget/text_header.dart';
import 'package:market/features/product/widget/details_list/details_list.dart';

enum ProductAttrType {
  details('Product Details'),
  supply('View Supply Details'),
  reviews('Product Reviews');

  const ProductAttrType(this.value);

  final String value;
}

class ProductPanel extends StatefulWidget {
  const ProductPanel({
    required this.type,
    this.detailsList,
    this.supplyList,
    this.initiallyExpanded = false,
    super.key,
  });

  final ProductAttrType type;
  final bool initiallyExpanded;
  final List<ProductDetail>? detailsList;
  final List<SupplyDetail>? supplyList;

  @override
  State<ProductPanel> createState() => _ProductPanelState();
}

class _ProductPanelState extends State<ProductPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff6C757D59)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: widget.initiallyExpanded,
              trailing: SvgPicture.asset('assets/svg/arrow_up.svg'),
              title: TextHeader(text: widget.type.value),
              childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
              children: [
                if (widget.type == ProductAttrType.details)
                  DetailsList(list: widget.detailsList ?? []),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
