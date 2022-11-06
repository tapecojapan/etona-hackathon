import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends ConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);
    final account = accountState.account;

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
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: ShadowLayout(
                      radius: 180,
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            color: palette.secondary,
                            width: 4,
                          ),
                        ),
                        child: CustomImageCard(
                          height: 96,
                          width: 96,
                          radius: 96,
                          assetURL: getEtonaImage(account?.favoriteEtona),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: ShadowLayout(
                      child: OutlinedTextButton(
                        sizeType: SizeType.small,
                        expand: false,
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        text: '推しETONAを変更',
                        onPressed: () {
                          final messenger = ScaffoldMessenger.of(context);
                          showSnackBar(
                            messenger: messenger,
                            text: '実装予定',
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: ShadowLayout(
                      radius: 10,
                      child: Container(
                        //height: size,
                        //width: size,
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 36),
                        width: 300,
                        decoration: BoxDecoration(
                          color: palette.gray7,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: palette.secondary,
                            width: 4,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '総獲得枚数',
                              style: ui22Bold,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: RichText(
                                text: TextSpan(
                                  style: ui54Bold.copyWith(
                                    color: palette.secondary,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '60',
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(4, 0, 4, 12),
                                        child: Text(
                                          '枚',
                                          style: ui22Bold.copyWith(
                                            color: palette.secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              width: 224,
                              height: 54,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ShadowLayout(
                    child: OutlinedTextButton(
                      sizeType: SizeType.medium,
                      colorType: ColorType.both,
                      width: 180,
                      expand: false,
                      text: 'サウンド設定',
                      onPressed: () {
                        GoRouter.of(context).go('/my-page/settings');
                      },
                    ),
                  ),
                  SizedBox(height: 16),
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
