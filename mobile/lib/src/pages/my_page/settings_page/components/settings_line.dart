import 'package:flutter/material.dart';

class SettingsLine extends StatelessWidget {
  const SettingsLine({
    Key? key,
    required this.title,
    required this.icon,
    this.onSelected,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                )),
            const Spacer(),
            icon,
          ],
        ),
      ),
    );
  }
}
