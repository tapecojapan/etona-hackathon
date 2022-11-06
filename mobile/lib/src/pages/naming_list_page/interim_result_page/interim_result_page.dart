import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InterimResultPage extends HookConsumerWidget {
  const InterimResultPage({
    Key? key,
    required this.playId,
    required this.order,
  }) : super(key: key);

  final String playId;
  final int order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const preCelebrationDuration = Duration(seconds: 5);
    final duringCelebration = useState(false);
    final isMounted = useIsMounted();
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);
    final answers = playsController.getCurrentAnswers(order);
    final myAnswer = playsController.getAnswer(order);
    final rank = playsController.getInterimRank(order, account?.id);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (answers.length < 4) {
          return;
        }
        final goRouter = GoRouter.of(context);
        if (myAnswer == null) {
          return;
        }
        final correct = playsController.isCollectAnswer(myAnswer);
        if (rank == 0 && correct) {
          if (isMounted()) {
            duringCelebration.value = true;
          }
          await Future<void>.delayed(preCelebrationDuration);
          if (isMounted()) {
            duringCelebration.value = false;
          }
        } else {
          await Future<void>.delayed(preCelebrationDuration);
        }
        final nextPage = order >= 6
            ? '/play/$playId/result'
            : '/play/$playId/play-choice/${order + 1}';
        goRouter.go(nextPage);
      });
      return;
    }, [answers]);

    String getSeconds(Answer answer) {
      final milliseconds = answer.tapMilliseconds ?? 0;
      final seconds = (milliseconds / 100).ceil();
      return (seconds / 10).toString();
    }

    String title() {
      if (myAnswer == null) {
        return '集計中';
      }
      final correct = playsController.isCollectAnswer(myAnswer);
      if (!correct) {
        return 'そんな時もある';
      }
      if (rank == null || answers.length < 4) {
        return '集計中';
      }
      return resultText[rank];
    }

    return Scaffold(
      backgroundColor: palette.secondary,
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            final size = constraints.biggest;
            final padding = EdgeInsets.all(size.shortestSide / 30);
            return SafeArea(
              minimum: padding,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadowLayout(
                      radius: 10,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 24, 6, 24),
                        width: 274,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: palette.primary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: palette.secondary,
                            width: 4,
                          ),
                        ),
                        child: Text(
                          title(),
                          style: ui20Bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 274,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        itemCount: answers.length,
                        itemBuilder: (BuildContext context, int index) {
                          final answer = answers[index];
                          final player =
                              playsController.getPlayer(answer.playerId);
                          final myAccount = account?.id == player?.id;
                          final correct =
                              playsController.isCollectAnswer(answer);

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Column(
                                    children: [
                                      AvatarCard(
                                        assetURL: getEtonaImage(
                                          player?.favoriteEtona ?? '',
                                        ),
                                        backgroundColor: palette.gray1,
                                      ),
                                      Visibility(
                                        visible: myAccount,
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child: Text(
                                            'あなた',
                                            style: ui14Bold.copyWith(
                                              color: palette.gray8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      correct
                                          ? '${getSeconds(answer)}秒'
                                          : 'ちがうよ',
                                      style: ui40Bold.copyWith(
                                        color: () {
                                          if (index == 0) {
                                            return palette.red;
                                          } else if (index == 1) {
                                            return palette.primary;
                                          } else {
                                            return palette.gray8;
                                          }
                                        }(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox.expand(
            child: Visibility(
              visible: duringCelebration.value,
              child: IgnorePointer(
                child: ConfettiCard(
                  isStopped: !duringCelebration.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
