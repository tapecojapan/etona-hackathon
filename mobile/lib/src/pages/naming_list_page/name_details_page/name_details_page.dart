import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameDetailsPage extends HookConsumerWidget {
  const NameDetailsPage({
    Key? key,
    required this.etona,
    required this.playId,
  }) : super(key: key);

  final Etona etona;
  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Palette();
    final name = useState(etona.name ?? '');
    final nameController = useTextEditingController(text: name.value);

    void onChanged(String value) {
      name.value = value;
    }

    void popPage() {
      GoRouter.of(context).pop();
    }

    void saveAndNextPage() {
      final newEtona = etona.copyWith(name: name.value);
      ref.read(etonasNamingProvider(playId).notifier).updateEtona(newEtona);
      GoRouter.of(context).pop();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: palette.secondary,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(64, 16, 64, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: SquareCard(
                    sizeType: SizeType.large,
                    photoURL: etona.photoURL,
                    assetURL: getEtonaImage(etona.id),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    backgroundColor: palette.gray1,
                  ),
                ),
                Container(
                  width: 240,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: TextFormField(
                    onChanged: onChanged,
                    controller: nameController,
                    cursorColor: Colors.white,
                    style: ui16Bold,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      //KanaFormatter(),
                      LengthLimitingFormatter(12),
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: palette.gray8.withOpacity(0.8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: palette.gray10,
                          width: 3.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: palette.gray10,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SizedBox(
                    width: 240,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(36, 0, 20, 0),
                          child: RichText(
                            text: TextSpan(
                              style: ui12Bold.copyWith(
                                color: palette.red,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'カタカナ',
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: Text(
                                      '${name.value.length}/12',
                                      style: ui20Bold.copyWith(
                                          color: palette.red, height: 1),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: '文字',
                                ),
                              ],
                            ),
                          ),
                        ),
                        OutlinedIconButton(
                          backgroundColor: palette.gray8.withOpacity(0.8),
                          borderColor: palette.gray10,
                          borderWidth: 2,
                          icon: Icons.shuffle,
                          onPressed: () {
                            final messenger = ScaffoldMessenger.of(context);
                            showSnackBar(
                              messenger: messenger,
                              text: '実装予定',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    '誰かが傷ついたり、嫌がる名前はやめてね！',
                    textAlign: TextAlign.center,
                    style: ui12Bold.copyWith(
                      color: palette.brown,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Column(
                    children: [
                      ShadowLayout(
                        child: OutlinedTextButton(
                          sizeType: SizeType.medium,
                          expand: false,
                          width: 184,
                          text: '保存して次へ',
                          onPressed: saveAndNextPage,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ShadowLayout(
                        child: OutlinedTextButton(
                          sizeType: SizeType.medium,
                          expand: false,
                          width: 184,
                          text: '一覧へ戻る',
                          onPressed: popPage,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Consumer(
                          builder: (context, ref, _) {
                            const count = 120000;
                            final stopwatchState =
                                ref.watch(stopwatchProvider(count));
                            final milliseconds =
                                count - stopwatchState.elapsedMilliseconds;
                            final seconds = (milliseconds / 1000).ceil();

                            return Text(
                              seconds < 0 ? '0' : seconds.toString(),
                              textAlign: TextAlign.center,
                              style: ui40Bold.copyWith(
                                color: palette.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
