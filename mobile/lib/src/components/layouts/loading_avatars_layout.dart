import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class LoadingAvatarsLayout extends StatelessWidget {
  const LoadingAvatarsLayout({
    Key? key,
    required this.text,
    required this.players,
    this.account,
  }) : super(key: key);

  final String text;
  final List<Player> players;
  final Account? account;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
          child: Text(
            '参加者を待っています',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ],
    );
  }
}
