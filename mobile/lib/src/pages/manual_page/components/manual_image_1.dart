import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ManualImage1 extends StatelessWidget {
  const ManualImage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget square() {
      return Container(
        height: 40,
        width: 40,
        color: palette.gray1,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        square(),
        const SizedBox(width: 10),
        square(),
        const SizedBox(width: 10),
        square(),
      ],
    );
  }
}
