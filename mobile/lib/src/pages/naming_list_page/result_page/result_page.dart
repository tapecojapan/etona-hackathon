import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({
    Key? key,
    required this.playId,
  }) : super(key: key);

  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const preCelebrationDuration = Duration(seconds: 3);
    final duringCelebration = useState(true);
    final isMounted = useIsMounted();
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);
    final victoryCount = playsController.getVictoryCount(account?.id);
    final ranking = playsController.getRanking();

    useEffect(() {
      () async {
        await Future<void>.delayed(preCelebrationDuration);
        if (isMounted()) {
          duringCelebration.value = false;
        }
      }();
      return;
    }, []);

    String rankingText() {
      if (ranking == 1) {
        return '優勝';
      } else {
        return '$ranking位';
      }
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
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadowLayout(
                      radius: 10,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 12),
                        width: 240,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: palette.secondary,
                            width: 4,
                          ),
                        ),
                        child: Column(
                          children: [
                            AvatarCard(
                              assetURL: getEtonaImage(account?.favoriteEtona),
                              backgroundColor: palette.gray1,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                              child: Text(
                                '$victoryCount枚獲得',
                                style: ui32Bold.copyWith(color: palette.red),
                              ),
                            ),
                            Text(
                              rankingText(),
                              style: ui54Bold.copyWith(color: palette.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 64),
                    ShadowLayout(
                      child: OutlinedTextButton(
                        sizeType: SizeType.large,
                        text: 'もう一度プレイ',
                        onPressed: () {
                          final messenger = ScaffoldMessenger.of(context);
                          showSnackBar(
                            messenger: messenger,
                            text: '実装予定',
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    ShadowLayout(
                      child: OutlinedTextButton(
                        sizeType: SizeType.large,
                        text: '名前を振り返る',
                        onPressed: () {
                          final messenger = ScaffoldMessenger.of(context);
                          showSnackBar(
                            messenger: messenger,
                            text: '実装予定',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShadowLayout(
                            child: OutlinedTextButton(
                              sizeType: SizeType.large,
                              expand: false,
                              width: 104,
                              text: '戻る',
                              onPressed: () {
                                GoRouter.of(context).go('/');
                              },
                            ),
                          ),
                          ShadowLayout(
                            child: OutlinedTextButton(
                              sizeType: SizeType.large,
                              expand: false,
                              width: 104,
                              text: 'シェア',
                              onPressed: () {
                                final messenger = ScaffoldMessenger.of(context);
                                showSnackBar(
                                  messenger: messenger,
                                  text: '実装予定',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
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
