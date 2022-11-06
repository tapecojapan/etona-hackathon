import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/components.dart';

class PlayChoicePage extends HookConsumerWidget {
  const PlayChoicePage({
    Key? key,
    required this.etona,
    required this.playId,
    required this.order,
    required this.etonas,
    required this.names,
  }) : super(key: key);

  final Etona etona;
  final String playId;
  final int order;
  final List<Etona> etonas;
  final List<String> names;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //const count = 100000;
    final accountState = ref.watch(accountProvider);
    final isLoading = useState(true);
    final account = accountState.account;
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);

    final stopwatch = Stopwatch()..start();

    Future<void> onTap(int index) async {
      final milliseconds = stopwatch.elapsedMilliseconds;
      final answer = Answer(
        etonaId: etona.id,
        playerId: account?.id,
        tapMilliseconds: milliseconds,
        imageAnswer: etona.type == 0 ? etonas[index].id : null,
        nameAnswer: etona.type == 0 ? null : names[index],
      );
      isLoading.value = true;
      await playsController.insertAnswer(
        context: context,
        answer: answer,
        order: order,
      );
      //isLoading.value = false;
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showCustomDialog<void>(
          context: context,
          barrierColor: palette.gray9,
          widget: const WaitingGameStartModal(),
        );
        //ref.refresh(stopwatchProvider(count));
        isLoading.value = false;
      });
      return;
    }, []);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: SafeArea(
        child: isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(palette.primary),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: etona.type == 0
                    ? ChoiceImage(
                        etona: etona,
                        etonas: etonas,
                        onTap: onTap,
                      )
                    : ChoiceName(
                        etona: etona,
                        names: names,
                        onTap: onTap,
                      ),
              ),
      ),
    );
  }
}
