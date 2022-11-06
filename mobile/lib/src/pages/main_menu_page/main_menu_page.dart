import 'package:etona/main.dart';
import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/pages/naming_list_page/play_choice_page/play_choice_page.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../audio/sounds.dart';

class MainMenuPage extends ConsumerWidget {
  const MainMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final settingsState = ref.watch(settingsProvider);
    final settingsController = ref.read(settingsProvider.notifier);
    final gamesServicesController = gamesServicesControllerProvider != null
        ? ref.watch(gamesServicesControllerProvider!)
        : null;

    return Scaffold(
      backgroundColor: palette.secondary,
      body: ResponsiveLayout(
        mainAreaProminence: 0.45,
        squarishMainArea: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: ShadowLayout(
                radius: 128,
                child: OutlinedIconButton(
                  sizeType: SizeType.large,
                  //icon: Icons.settings,
                  svgIcon: 'assets/icons/binoculars.svg',
                  onPressed: () {
                    final messenger = ScaffoldMessenger.of(context);
                    showSnackBar(
                      messenger: messenger,
                      text: '実装予定',
                    );
                    //GoRouter.of(context).go('/naming-list/7KFcoGPTcKxgbcFyTfAl');
                    //GoRouter.of(context).go('/naming-list/7KFcoGPTcKxgbcFyTfAl/details/d');
                    /*ref
                        .read(audioControllerProvider.notifier)
                        .playSfx(SfxType.buttonTap);
                    GoRouter.of(context).go('/naming-list');*/
                  },
                ),
              ),
            ),
            /*Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: -0.1,
                  child: Text(
                    'ETONA',
                    textAlign: TextAlign.center,
                    style: ui50Bold.copyWith(color: palette.primary),
                  ),
                ),
              ),
            ),*/
            SizedBox(height: 24),
            Text(
              'ETONA',
              textAlign: TextAlign.center,
              style: ui50Bold.copyWith(color: palette.primary),
            ),
            SizedBox(height: 24),
            Transform.translate(
              offset: Offset(10, 0),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  const CustomImageCard(
                    height: 180,
                    width: 180,
                    assetURL: 'assets/images/etn4.png',
                  ),
                  Positioned(
                    left: -74,
                    bottom: -23,
                    child: Transform.rotate(
                      angle: -0.25,
                      child: const CustomImageCard(
                        height: 150,
                        width: 150,
                        assetURL: 'assets/images/etn12.png',
                      ),
                    ),
                  ),
                  const Positioned(
                    right: -62,
                    bottom: -10,
                    child: CustomImageCard(
                      height: 145,
                      width: 145,
                      assetURL: 'assets/images/etn8.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadowLayout(
                child: OutlinedTextButton(
                  sizeType: SizeType.large,
                  text: 'ランダムマッチ',
                  onPressed: () async {
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
                  text: 'フレンドマッチ',
                  onPressed: () async {
                    await showCustomDialog<void>(
                      context: context,
                      widget: CustomModal(
                        title: 'はじめまして☺️',
                        description: 'ゲームを遊ぶ前にルールを確認しますか？',
                        leftButtonText: 'いいえ',
                        rightButtonText: 'はい！',
                        onTapLeft: () {
                          ref
                              .read(audioControllerProvider.notifier)
                              .playSfx(SfxType.buttonTap);
                          GoRouter.of(context).go('/friend-match');
                        },
                        onTapRight: () {
                          ref
                              .read(audioControllerProvider.notifier)
                              .playSfx(SfxType.buttonTap);
                          GoRouter.of(context).go('/manual', extra: true);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadowLayout(
                    radius: 128,
                    child: OutlinedIconButton(
                      sizeType: SizeType.large,
                      icon: Icons.face,
                      onPressed: () {
                        final messenger = ScaffoldMessenger.of(context);
                        showSnackBar(
                          messenger: messenger,
                          text: '実装予定',
                        );
                      },
                    ),
                  ),
                  ShadowLayout(
                    radius: 128,
                    child: OutlinedIconButton(
                      sizeType: SizeType.large,
                      icon: Icons.settings,
                      onPressed: () {
                        GoRouter.of(context).go('/my-page');
                      },
                    ),
                  ),
                  ShadowLayout(
                    radius: 128,
                    child: OutlinedIconButton(
                      iconSize: 28,
                      sizeType: SizeType.large,
                      icon: Icons.question_mark,
                      onPressed: () {
                        /*GoRouter.of(context)
                            .go('/naming-list/play-choice-name/${1}');*/
                        /*GoRouter.of(context)
                            .go('/naming-list/interim-result');*/
                        /*GoRouter.of(context)
                            .go('/naming-list/result');*/
                        //GoRouter.of(context).go('/my-page');
                        GoRouter.of(context).go('/manual');
                      },
                    ),
                  ),
                ],
              ),
              _gap
            ],
          ),
        ),
      ),
    );
  }

  /// Prevents the game from showing game-services-related menu items
  /// until we're sure the player is signed in.
  ///
  /// This normally happens immediately after game start, so players will not
  /// see any flash. The exception is folks who decline to use Game Center
  /// or Google Play Game Services, or who haven't yet set it up.
  Widget _hideUntilReady({required Widget child, required Future<bool> ready}) {
    return FutureBuilder<bool>(
      future: ready,
      builder: (context, snapshot) {
        // Use Visibility here so that we have the space for the buttons
        // ready.
        return Visibility(
          visible: snapshot.data ?? false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: child,
        );
      },
    );
  }

  static const _gap = SizedBox(height: 10);
}
