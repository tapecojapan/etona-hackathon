import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class OutlinedTextButton extends StatelessWidget {
  const OutlinedTextButton({
    Key? key,
    required this.text,
    this.expand = true,
    this.width = 0.0,
    this.radius = 10,
    this.sizeType = SizeType.medium,
    this.colorType = ColorType.primary,
    this.padding,
    this.loading = false,
    this.disabled = false,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final bool expand;
  final double width;
  final double radius;
  final SizeType sizeType;
  final ColorType colorType;
  final EdgeInsets? padding;
  final bool loading;
  final bool disabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final minWidth = expand ? double.infinity : width;
    final backgroundColor = colorType == ColorType.primary
        ? palette.primary
        : palette.gray8.withOpacity(0.8);
    final borderColor =
        colorType == ColorType.black ? palette.gray10 : palette.secondary;
    final borderWidth = colorType == ColorType.black ? 3.0 : 4.0;

    final loadingSize = () {
      if (sizeType == SizeType.small) {
        return 16.0;
      } else if (sizeType == SizeType.medium) {
        return 16.0;
      } else {
        return 22.0;
      }
    }();

    final textStyle = () {
      if (sizeType == SizeType.small) {
        return ui16Bold.copyWith(height: 1.2);
      } else if (sizeType == SizeType.medium) {
        return ui16Bold.copyWith(height: 1.2);
      } else {
        return ui22Bold.copyWith(height: 1.2);
      }
    }();

    return CustomOutlinedButton(
      minWidth: minWidth,
      radius: radius,
      sizeType: sizeType,
      backgroundColor: disabled ? palette.gray4 : backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      padding: padding,
      onPressed: disabled ? null : onPressed,
      child: loading
          ? SizedBox(
              height: loadingSize,
              width: loadingSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(borderColor),
              ),
            )
          : Text(
              text,
              style: textStyle,
            ),
    );
  }
}
