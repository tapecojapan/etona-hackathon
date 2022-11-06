import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemorizePage extends HookConsumerWidget {
  const MemorizePage({
    Key? key,
    required this.playId,
  }) : super(key: key);

  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);
    final etonas = playsState.etonas;
    const count = 30000;
    final stopwatchState = ref.watch(stopwatchProvider(count));
    final milliseconds = count - stopwatchState.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).ceil();

    useEffect(() {
      ref.refresh(stopwatchProvider(count));
      return;
    }, []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (seconds <= 0) {
          GoRouter.of(context).go('/play/$playId/play-choice/1');
        }
      });
      return;
    }, [seconds]);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Text(
                  '名前を覚えよう🥳',
                  textAlign: TextAlign.center,
                  style: ui24Black.copyWith(
                    color: palette.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  seconds < 0 ? '0' : seconds.toString(),
                  textAlign: TextAlign.center,
                  style: ui40Bold.copyWith(
                    color: palette.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: NamedEtonasLayout(
                  etonas: etonas,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
