import 'package:flutter/material.dart';
import 'package:etona/src/utils/utils.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.child,
    this.minWidth = double.infinity,
    this.radius = 10,
    this.sizeType = SizeType.medium,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 4,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final double minWidth;
  final double radius;
  final SizeType sizeType;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = Palette();
    final minHeight = () {
      if (sizeType == SizeType.small) {
        return 40.0;
      } else if (sizeType == SizeType.medium) {
        return 48.0;
      } else {
        return 64.0;
      }
    }();

    final currentPadding = () {
      if (sizeType == SizeType.small) {
        return padding ?? const EdgeInsets.fromLTRB(12, 12, 12, 12);
      } else if (sizeType == SizeType.medium) {
        return padding ?? const EdgeInsets.fromLTRB(12, 12, 12, 12);
      } else {
        return padding ?? const EdgeInsets.fromLTRB(16, 16, 16, 16);
      }
    }();

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: backgroundColor ?? palette.primary,
        //minimumSize: Size(50 * tsp, buttonHeight),
        //padding: EdgeInsets.zero,
        minimumSize: Size(minWidth, minHeight),
        padding: currentPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: BorderSide(
          width: borderWidth,
          color: borderColor ?? palette.secondary,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
