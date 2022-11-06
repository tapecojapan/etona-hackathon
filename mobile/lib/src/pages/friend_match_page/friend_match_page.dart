import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendMatchPage extends HookConsumerWidget {
  const FriendMatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;
    final password = useState('');
    final isInsertLoading = useState(false);
    final isPushLoading = useState(false);
    final passwordController = useTextEditingController(text: password.value);

    void onChanged(String value) {
      password.value = value;
    }

    bool disabled() {
      return password.value.isEmpty;
    }

    Future<void> insertPassword() async {
      isInsertLoading.value = true;
      await ref
          .read(passwordProvider.notifier)
          .insertPassword(context, password.value);
      isInsertLoading.value = false;
    }

    Future<void> pushPlayer() async {
      isPushLoading.value = true;
      await ref
          .read(passwordProvider.notifier)
          .pushPlayer(context, password.value);
      isPushLoading.value = false;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: palette.secondary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                  child: Text(
                    'フレンドマッチ',
                    textAlign: TextAlign.center,
                    style: ui28Bold.copyWith(
                      color: palette.primary,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                AvatarCard(
                  assetURL: getEtonaImage(account?.favoriteEtona),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 32),
                ShadowLayout(
                  radius: 10,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(6, 20, 6, 20),
                    width: 240,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: palette.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: palette.secondary,
                        width: 4,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '友達と決めた\n合言葉を入力してね',
                          textAlign: TextAlign.center,
                          style: ui20Bold,
                        ),
                        Container(
                          width: 240,
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: TextFormField(
                            onChanged: onChanged,
                            controller: passwordController,
                            cursorColor: palette.gray8,
                            style: ui20Bold.copyWith(color: palette.gray8),
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingFormatter(6),
                            ],
                            decoration: InputDecoration(
                              hintText: 'あいことば',
                              hintStyle:
                                  ui20Bold.copyWith(color: palette.gray1),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(6, 12, 6, 12),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Text(
                          'ひらがなで6文字まで',
                          textAlign: TextAlign.center,
                          style: ui14Bold.copyWith(color: palette.purple),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ShadowLayout(
                  child: OutlinedTextButton(
                    sizeType: SizeType.medium,
                    expand: false,
                    width: 240,
                    loading: isPushLoading.value,
                    disabled: disabled() || isInsertLoading.value,
                    text: '決定',
                    onPressed: pushPlayer,
                  ),
                ),
                SizedBox(height: 36),
                ShadowLayout(
                  child: OutlinedTextButton(
                    sizeType: SizeType.medium,
                    expand: false,
                    width: 240,
                    disabled: disabled() || isPushLoading.value,
                    loading: isInsertLoading.value,
                    text: '合言葉をシェア',
                    onPressed: insertPassword,
                  ),
                ),
                SizedBox(height: 36),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
