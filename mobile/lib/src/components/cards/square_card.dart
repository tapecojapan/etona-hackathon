import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
  const SquareCard({
    Key? key,
    this.photoURL,
    this.assetURL,
    this.sizeType = SizeType.medium,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  final String? photoURL;
  final String? assetURL;
  final SizeType sizeType;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final size = () {
      if (sizeType == SizeType.small) {
        return 100.0;
      } else if (sizeType == SizeType.medium) {
        return 100.0;
      } else {
        return 240.0;
      }
    }();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadowLayout(
          radius: 10,
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: palette.secondary,
                width: 4,
              ),
            ),
            child: CustomImageCard(
              height: size - 4,
              width: size - 4,
              radius: 6,
              photoURL: photoURL,
              assetURL: assetURL,
              padding: padding,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
