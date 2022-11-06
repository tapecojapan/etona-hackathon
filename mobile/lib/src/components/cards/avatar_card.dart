import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    Key? key,
    this.text,
    this.photoURL,
    this.assetURL,
    this.backgroundColor,
  }) : super(key: key);

  final String? text;
  final String? photoURL;
  final String? assetURL;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadowLayout(
          type: ShadowType.bottomRight,
          radius: 56,
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: palette.secondary,
              borderRadius: BorderRadius.circular(56),
              border: Border.all(
                color: palette.secondary,
                width: 3,
              ),
            ),
            child: CustomImageCard(
              height: 53,
              width: 53,
              radius: 53,
              backgroundColor: assetURL == null && photoURL == null
                  ? palette.gray2.withOpacity(0.1)
                  : backgroundColor,
              photoURL: photoURL,
              assetURL: assetURL,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
          ),
        ),
        if (text != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: ui14Bold.copyWith(
                color: palette.gray2,
              ),
            ),
          ),
      ],
    );
  }
}
