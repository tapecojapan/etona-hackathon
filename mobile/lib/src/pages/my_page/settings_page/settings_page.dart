import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/components.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final settingsController = ref.read(settingsProvider.notifier);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: LayoutBuilder(builder: (context, constraints) {
        final size = constraints.biggest;
        final padding = EdgeInsets.all(size.shortestSide / 30);
        return SafeArea(
          minimum: padding,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '設定',
                      textAlign: TextAlign.center,
                      style: ui24Black.copyWith(
                        color: palette.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SettingsLine(
                    title: 'Mute',
                    icon: Icon(settingsState.muted
                        ? Icons.volume_off
                        : Icons.volume_up),
                    onSelected: settingsController.toggleMuted,
                  ),
                  const SizedBox(height: 16),
                  SettingsLine(
                    title: 'Sound FX',
                    icon: Icon(settingsState.soundsOn
                        ? Icons.graphic_eq
                        : Icons.volume_off),
                    onSelected: settingsController.toggleSoundsOn,
                  ),
                  const SizedBox(height: 16),
                  SettingsLine(
                    title: 'Music',
                    icon: Icon(settingsState.musicOn
                        ? Icons.music_note
                        : Icons.music_off),
                    onSelected: settingsController.toggleMusicOn,
                  ),
                  /*SettingsLine(
                    title: 'Reset progress',
                    icon: const Icon(Icons.delete),
                    onSelected: () {
                      ref.read(playerProgressProvider.notifier).reset();

                      final messenger = ScaffoldMessenger.of(context);
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Player progress has been reset.')),
                      );
                    },
                  ),*/
                  const SizedBox(height: 40),
                  ShadowLayout(
                    child: OutlinedTextButton(
                      sizeType: SizeType.medium,
                      colorType: ColorType.both,
                      width: 180,
                      expand: false,
                      text: '閉じる',
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
