import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ManualImage4 extends StatelessWidget {
  const ManualImage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget square() {
      return Container(
        height: 90,
        width: 90,
        color: palette.gray1,
      );
    }

    Widget line() {
      return Container(
        height: 1,
        width: 90,
        color: palette.gray1,
      );
    }

    Widget nameText(String text) {
      return ShadowLayout(
        radius: 10,
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          width: 104,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: palette.gray8,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Text(
            text,
            style: ui12Bold,
          ),
        ),
      );
    }

    Widget nameSet() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nameText('リコピンマン'),
              SizedBox(width: 12),
              nameText('トマトマン'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nameText('レッドホット'),
              SizedBox(width: 12),
              nameText('ケチャップ'),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    square(),
                    const SizedBox(height: 1),
                    line(),
                    const SizedBox(height: 1),
                    line(),
                  ],
                ),
                const SizedBox(width: 32),
                square(),
              ],
            ),
            const CustomImageCard(
              assetURL: 'assets/images/arrow1.png',
              height: 77,
              width: 113,
            ),
          ],
        ),
        SizedBox(height: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            nameSet(),
            Transform.translate(
              offset: const Offset(-16, -4),
              child: const CustomImageCard(
                assetURL: 'assets/images/arrow2.png',
                height: 41,
                width: 39,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
