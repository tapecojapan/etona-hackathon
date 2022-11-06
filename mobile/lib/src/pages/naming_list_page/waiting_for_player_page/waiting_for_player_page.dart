import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WaitingForPlayerPage extends HookConsumerWidget {
  const WaitingForPlayerPage({
    Key? key,
    required this.playId,
  }) : super(key: key);

  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.read(playsProvider(playId).notifier);
    final players = playsController.getNamingCompletedPlayers();
    final etonasState = ref.watch(etonasNamingProvider(playId));
    final etonas = etonasState.etonas;
    final namedEtonas = playsController.getNamedEtonas();

    useEffect(() {
      () async {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (namedEtonas.length >= 12) {
            GoRouter.of(context).go('/play/$playId/memorize');
          }
        });
      }();
      return;
    }, [namedEtonas]);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAvatarsLayout(
                text: '参加者を待っています',
                players: players,
                account: account,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
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
