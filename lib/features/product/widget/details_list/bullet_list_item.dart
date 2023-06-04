import 'package:flutter/material.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/product/widget/details_list/bullet.dart';

class BulletListItem extends StatelessWidget {
  const BulletListItem({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Bullet(),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '$title: ', style: interBlack),
                TextSpan(text: description, style: interBlackW400),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
