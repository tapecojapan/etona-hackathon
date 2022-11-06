import 'package:flutter/material.dart';

enum ShadowType {
  all,
  bottomRight,
}

class ShadowLayout extends StatelessWidget {
  const ShadowLayout({
    super.key,
    this.radius = 10,
    required this.child,
    this.type = ShadowType.all,
  });

  final Widget child;
  final double radius;
  final ShadowType type;

  @override
  Widget build(BuildContext context) {
    final boxShadow = () {
      if (type == ShadowType.all) {
        return const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 8,
            blurRadius: 16,
            offset: Offset.zero,
          )
        ];
      } else if (type == ShadowType.bottomRight) {
        return const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(8, 8),
          )
        ];
      }
    }();

    return Container(
      //constraints: const BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
