import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'manual_image_1.dart';

class ManualImage3 extends StatelessWidget {
  const ManualImage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget nameTitle() {
      return ShadowLayout(
        radius: 10,
        child: Container(
          height: 16,
          width: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: palette.gray8.withOpacity(0.8),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: palette.gray10,
              width: 1,
            ),
          ),
        ),
      );
    }

    Widget nameRows() {
      return Transform.translate(
        offset: const Offset(0, -6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            nameTitle(),
            const SizedBox(width: 6),
            nameTitle(),
            const SizedBox(width: 6),
            nameTitle(),
          ],
        ),
      );
    }

    return Column(
      children: [
        const ManualImage1(),
        nameRows(),
        const SizedBox(height: 2),
        const ManualImage1(),
        nameRows(),
        const SizedBox(height: 8),
        const Icon(
          Icons.more_vert,
          size: 32,
          color: Colors.white,
        ),
      ],
    );
  }
}
