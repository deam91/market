import 'package:flutter/material.dart';
import 'package:market/features/home/model/product.dart';

import '../../../core/theme/texts.dart';

class SupplyStepItem extends StatelessWidget {
  const SupplyStepItem({super.key, required this.step, required this.index});
  final SupplyStep step;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 0,
            bottom: 0,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: Color(0xffED8F03),
                borderRadius: index == 0
                    ? BorderRadius.vertical(
                  top: Radius.circular(2.5),
                )
                    : BorderRadius.zero,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xffED8F03),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              step.title ?? '',
              style: archivoBlackSmall,
            ),
          )
        ],
      ),
    );
  }
}
