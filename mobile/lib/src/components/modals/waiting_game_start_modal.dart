import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WaitingGameStartModal extends HookConsumerWidget {
  const WaitingGameStartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const count = 3000;
    final stopwatchState = ref.watch(stopwatchProvider(count));
    final milliseconds = count - stopwatchState.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).ceil();

    useEffect(() {
      ref.refresh(stopwatchProvider(count));
      return;
    }, []);

    useEffect(() {
      if (seconds == 0) {
        Navigator.of(context).pop();
      }
      return;
    }, [seconds]);

    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      backgroundColor: palette.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ゲームスタートまで',
              textAlign: TextAlign.center,
              style: ui32Bold,
            ),
            Text(
              seconds < 0 ? '0' : seconds.toString(),
              textAlign: TextAlign.center,
              style: ui54Bold.copyWith(color: palette.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
