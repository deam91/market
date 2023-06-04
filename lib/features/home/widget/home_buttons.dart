import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 18, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffF5F4F6),
                borderRadius:
                BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 16),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/plus.svg',
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add Money \nTo Wallet',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffF5F4F6),
                borderRadius:
                BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 16),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/wallet_statement.svg',
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'My Wallet \nStatement',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
