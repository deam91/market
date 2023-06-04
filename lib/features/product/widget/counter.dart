import 'dart:math';

import 'package:flutter/material.dart';
import 'package:market/core/theme/texts.dart';

class Counter extends StatefulWidget {
  const Counter({required this.max, super.key});
  final int max;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xff6C757D59),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filled(
            onPressed: () => setState(() => count = max(0, count - 1)),
            icon: const Icon(Icons.remove),
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: const Color(0xffED8F03),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$count',
              style: archivoBlack,
            ),
          ),
          IconButton.filled(
            onPressed: () => setState(() => count = min(widget.max, count + 1)),
            icon: const Icon(Icons.add),
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: const Color(0xffED8F03),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
