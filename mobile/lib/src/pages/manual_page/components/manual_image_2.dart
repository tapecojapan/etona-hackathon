import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ManualImage2 extends StatelessWidget {
  const ManualImage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 120,
          width: 120,
          color: palette.gray1,
        ),
        Transform.translate(
          offset: const Offset(0, -12),
          child: ShadowLayout(
            radius: 10,
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              width: 165,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: palette.gray8.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: palette.gray10,
                  width: 3,
                ),
              ),
              child: Text(
                'リコピンマン',
                style: ui16Bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
