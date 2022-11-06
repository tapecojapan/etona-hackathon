import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchingPage extends HookConsumerWidget {
  const MatchingPage({
    Key? key,
    required this.playId,
  }) : super(key: key);

  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;
    final players = playsController.getPlayersWithoutMe();
    final godparentEtonas = playsController.getGodparentEtonas();

    useEffect(() {
      () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (godparentEtonas.isNotEmpty) {
            GoRouter.of(context).go('/play/$playId/naming-list');
          }
        });
      }();
      return;
    }, [godparentEtonas]);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: ResponsiveLayout(
        mainAreaProminence: 0.2,
        squarishMainArea: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAvatarsLayout(
                text: 'マッチング中',
                players: players,
                account: account,
              ),
              /*Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Text(
                  'マッチング中',
                  textAlign: TextAlign.center,
                  style: ui24Black.copyWith(
                    color: palette.primary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ThreeBounceIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 24, 40, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AvatarCard(
                      text: 'あなた',
                      assetURL: getEtonaImage(account?.favoriteEtona),
                      backgroundColor: palette.gray1,
                    ),
                    AvatarCard(
                      assetURL: players.isNotEmpty
                          ? getEtonaImage(players[0].favoriteEtona)
                          : null,
                      backgroundColor: palette.gray1,
                    ),
                    AvatarCard(
                      assetURL: players.length > 1
                          ? getEtonaImage(players[1].favoriteEtona)
                          : null,
                      backgroundColor: palette.gray1,
                    ),
                    AvatarCard(
                      assetURL: players.length > 2
                          ? getEtonaImage(players[2].favoriteEtona)
                          : null,
                      backgroundColor: palette.gray1,
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
        rectangularMenuArea: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            children: [
              ShadowLayout(
                child: OutlinedTextButton(
                  sizeType: SizeType.large,
                  expand: false,
                  width: 104,
                  text: '戻る',
                  onPressed: () async {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 192)
            ],
          ),
        ),
      ),
    );
  }
}
