import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    Key? key,
    this.icon,
    this.svgIcon,
    this.iconSize = 24,
    this.radius = 128,
    this.sizeType = SizeType.medium,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 4,
    this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final String? svgIcon;
  final double iconSize;
  final double radius;
  final SizeType sizeType;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final minWidth = () {
      if (sizeType == SizeType.small) {
        return 36.0;
      } else if (sizeType == SizeType.medium) {
        return 48.0;
      } else {
        return 64.0;
      }
    }();

    return CustomOutlinedButton(
      minWidth: minWidth,
      radius: radius,
      sizeType: sizeType,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onPressed: onPressed,
      child: svgIcon != null
          ? SvgPicture.asset(
              svgIcon!,
              semanticsLabel: 'shopping',
              color: Colors.white,
              height: iconSize,
              width: iconSize,
            )
          : Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            ),
    );
  }
}
