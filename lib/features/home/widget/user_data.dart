import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/texts.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 58 / 2),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shivam Kumar Varshney',
                  style: interWhite.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('shivamvarshney30@gmail.com', style: interWhite),
                const SizedBox(height: 2),
                const Text('+91 7983872298', style: interWhite),
              ],
            )
          ],
        ),
        const SizedBox(height: 16),
        SearchBar(
          leading: SvgPicture.asset('assets/svg/search.svg'),
          elevation: MaterialStateProperty.all<double>(0),
        ),
      ],
    );
  }
}
