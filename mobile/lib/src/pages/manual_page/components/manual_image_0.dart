import 'package:flutter/material.dart';
import 'package:etona/src/utils/utils.dart';

import 'manual_image_1.dart';

class ManualImage0 extends StatelessWidget {
  const ManualImage0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            ManualImage1(),
            SizedBox(height: 12),
            ManualImage1(),
          ],
        ),
        const SizedBox(width: 16),
        const Icon(
          Icons.more_horiz,
          size: 32,
          color: Colors.white,
        ),
      ],
    );
  }
}
