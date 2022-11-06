import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class SquareTextCard extends StatelessWidget {
  const SquareTextCard({
    Key? key,
    this.text,
    this.center = false,
  }) : super(key: key);

  final String? text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadowLayout(
          radius: 10,
          child: Container(
            alignment: center ? Alignment.center : null,
            padding: EdgeInsets.fromLTRB(center ? 4 : 6, 4, center ? 4 : 6, 4),
            width: double.infinity,
            decoration: BoxDecoration(
              color: palette.gray8.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: palette.gray10,
                width: 3,
              ),
            ),
            child: Text(
              text ?? '',
              style: ui14Bold,
            ),
          ),
        ),
      ],
    );
  }
}
