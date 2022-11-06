import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key? key,
    required this.title,
    this.sizeType = SizeType.medium,
  }) : super(key: key);

  final String title;
  final SizeType sizeType;

  @override
  Widget build(BuildContext context) {
    final padding = () {
      if (sizeType == SizeType.large) {
        return const EdgeInsets.fromLTRB(32, 6, 32, 6);
      } else {
        return const EdgeInsets.fromLTRB(32, 6, 32, 6);
      }
    }();

    final textStyle = () {
      if (sizeType == SizeType.large) {
        return ui20Bold.copyWith(height: 1.2);
      } else {
        return ui16Bold.copyWith(height: 1.2);
      }
    }();

    final borderWidth = () {
      if (sizeType == SizeType.large) {
        return 3.0;
      } else {
        return 2.0;
      }
    }();

    final minWidth = () {
      if (sizeType == SizeType.large) {
        return 160.0;
      } else {
        return 200.0;
      }
    }();

    return Container(
      padding: padding,
      constraints: BoxConstraints(
        minWidth: minWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: palette.secondary,
          width: borderWidth,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
