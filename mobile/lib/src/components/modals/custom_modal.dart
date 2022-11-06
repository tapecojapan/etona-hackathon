import 'dart:ui';

import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomModal extends ConsumerWidget {
  const CustomModal({
    Key? key,
    required this.title,
    this.description,
    required this.leftButtonText,
    required this.rightButtonText,
    this.onTapLeft,
    this.onTapRight,
  }) : super(key: key);

  final String title;
  final String? description;
  final String leftButtonText;
  final String rightButtonText;
  final void Function()? onTapLeft;
  final void Function()? onTapRight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        elevation: 0,
        insetPadding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
        backgroundColor: palette.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: ui20Bold.copyWith(
                  color: palette.primary,
                ),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 10, 28, 0),
                  child: Text(
                    description!,
                    style: ui16Medium.copyWith(
                      color: palette.gray2,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ShadowLayout(
                        child: OutlinedTextButton(
                          expand: false,
                          sizeType: SizeType.medium,
                          text: leftButtonText,
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (onTapLeft == null) {
                              return;
                            }
                            onTapLeft!();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ShadowLayout(
                        child: OutlinedTextButton(
                          expand: false,
                          sizeType: SizeType.medium,
                          text: rightButtonText,
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (onTapRight == null) {
                              return;
                            }
                            onTapRight!();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
