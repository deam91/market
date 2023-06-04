import 'package:flutter/material.dart';

import 'package:market/core/theme/texts.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: interBlack.copyWith(
        color: const Color(0xffED8F03),
      ),
    );
  }
}
