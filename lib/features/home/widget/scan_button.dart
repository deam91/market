import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class ScanButton extends StatefulWidget {
  const ScanButton({super.key});

  @override
  State<ScanButton> createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
      ),
      onPressed: () {
        _controller.forward(from: 0);
      },
      icon: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xffFFB75E), Color(0xffED8F03)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SizedBox(
          height: 92,
          width: 92,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/svg/qr_code_scan.svg',
            ),
          ),
        ),
      ),
    ).animate(controller: _controller).shake();
  }
}
