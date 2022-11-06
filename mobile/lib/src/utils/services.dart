import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey(debugLabel: 'scaffoldMessengerKey');

Future<T?> showCustomDialog<T>({
  required Widget widget,
  required BuildContext context,
  Color? barrierColor,
  bool barrierDismissible = true,
}) async {
  final result = await showDialog<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    barrierColor: barrierColor ?? Colors.black45,
    builder: (_) => widget,
  );
  return result;
}

void showSnackBar({
  required ScaffoldMessengerState messenger,
  required String text,
  Color? backgroundColor,
}) {
  messenger.showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        text,
        style: ui14Bold,
      ),
    ),
  );
}
