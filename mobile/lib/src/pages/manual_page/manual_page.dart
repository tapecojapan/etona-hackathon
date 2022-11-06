import 'package:etona/src/components/components.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/components.dart';

class ManualPage extends ConsumerWidget {
  const ManualPage({
    Key? key,
    required this.isPlay,
  }) : super(key: key);

  final bool isPlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTap() {
      if (isPlay) {
        GoRouter.of(context).go('/friend-match');
        //GoRouter.of(context).go('/matching');
      } else {
        GoRouter.of(context).pop();
      }
    }

    Widget typography({
      required String text,
      double? paddingTop,
      SizeType sizeType = SizeType.medium,
    }) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, paddingTop ?? 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: sizeType == SizeType.large ? ui16Bold : ui16Medium,
        ),
      );
    }

    return Scaffold(
      backgroundColor: palette.secondary,
      body: LayoutBuilder(builder: (context, constraints) {
        final size = constraints.biggest;
        final padding = EdgeInsets.all(size.shortestSide / 30);
        return SafeArea(
          minimum: padding,
          child: ShadowLayout(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                    padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
                    decoration: BoxDecoration(
                      color: palette.gray7,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: palette.secondary,
                        width: 4,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          const TitleCard(
                            title: 'ゲーム説明',
                            sizeType: SizeType.large,
                          ),
                          typography(
                            sizeType: SizeType.large,
                            text: '記憶力と瞬発力が鍛えられるゲームです☺️',
                            paddingTop: 24,
                          ),
                          typography(
                            sizeType: SizeType.large,
                            text: '謎の生命体が描かれたカードを12種類ご用意しました。️',
                            paddingTop: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: ManualImage0(),
                          ),
                          const TitleCard(
                            title: '1.カード配布タイム',
                          ),
                          typography(
                            text: '12枚の内から参加者の数に応じて3〜6枚がランダムに配られます。️',
                            paddingTop: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: ManualImage1(),
                          ),
                          const TitleCard(
                            title: '2.名づけタイム',
                          ),
                          typography(
                            text: 'あなたは配られた謎の生命体に好きなようにカタカナで名前を付けてください😁️',
                            paddingTop: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ManualImage2(),
                          ),
                          Text(
                            '他の参加者へも別のカードが配られており、それぞれ名前を付けています。',
                            style: ui12Bold.copyWith(color: palette.gray3),
                          ),
                          SizedBox(height: 40),
                          const TitleCard(
                            title: '3.記憶タイム',
                          ),
                          typography(
                            text:
                                '全部のカードの名前をできるだけ多く記憶しよう！自分が名付けたキャラ以外を積極的に覚えよう😉',
                            paddingTop: 16,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: ManualImage3(),
                          ),
                          const TitleCard(
                            title: '4.ゲーム開始',
                          ),
                          typography(
                            text:
                                '１枚づつカードがめくられます。正解の名前と違う名前が出てくるので、正解の名前をタップしよう🤩',
                            paddingTop: 16,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: ManualImage4(),
                          ),
                          Text(
                            '12枚中1番枚数を獲得した人が勝利です🙌',
                            style: ui20Bold,
                          ),
                          SizedBox(height: 72),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ShadowLayout(
                  child: OutlinedTextButton(
                    sizeType: SizeType.medium,
                    colorType: ColorType.both,
                    width: 180,
                    expand: false,
                    text: '閉じる',
                    onPressed: onTap,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
