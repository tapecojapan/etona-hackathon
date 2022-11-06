import 'package:etona/src/utils/utils.dart';
import 'package:flutter/widgets.dart';

import 'delay_tween.dart';

class ThreeBounceIndicator extends StatefulWidget {
  const ThreeBounceIndicator({
    Key? key,
    this.color,
    this.size = 32.0,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
  }) : super(key: key);

  final Color? color;
  final double size;
  final Duration duration;
  final AnimationController? controller;

  @override
  ThreeBounceIndicatorState createState() => ThreeBounceIndicatorState();
}

class ThreeBounceIndicatorState extends State<ThreeBounceIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 0.4, end: 1, delay: i * .2)
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => DecoratedBox(
      decoration: BoxDecoration(
          color: widget.color ?? Palette().primary, shape: BoxShape.circle));
}
