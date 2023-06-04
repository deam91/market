import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/widget/text_header.dart';
import 'package:market/features/product/widget/product_panel.dart';

class ProductPanelLink extends StatefulWidget {
  const ProductPanelLink({
    required this.type,
    required this.onTap,
    super.key,
  });

  final ProductAttrType type;
  final VoidCallback onTap;

  @override
  State<ProductPanelLink> createState() => _ProductPanelLinkState();
}

class _ProductPanelLinkState extends State<ProductPanelLink> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: widget.onTap,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff6C757D59)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    trailing: SvgPicture.asset('assets/svg/arrow_next.svg'),
                    title: TextHeader(text: widget.type.value),
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
