import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayChoiceImagePage extends HookConsumerWidget {
  const PlayChoiceImagePage({
    Key? key,
    required this.etona,
  }) : super(key: key);

  final Etona etona;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const count = 100000;
    final stopwatchState = ref.watch(stopwatchProvider(count));
    final milliseconds = stopwatchState.elapsedMilliseconds;

    void onTap() {
      print(milliseconds);
      GoRouter.of(context).go('/naming-list/result');
    }

    useEffect(() {
      ref.refresh(stopwatchProvider(count));
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showCustomDialog<void>(
          context: context,
          barrierColor: palette.gray9,
          widget: const WaitingGameStartModal(),
        );
      });
      return;
    }, []);

    return Scaffold(
      backgroundColor: palette.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 240,
                child: OutlinedTextButton(
                  colorType: ColorType.black,
                  text: 'ががが',
                ),
              ),
              GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 172,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(0, 64, 0, 0),
                //itemCount: etonas.length,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SquareCard(
                        sizeType: SizeType.medium,
                        photoURL: etona.photoURL,
                        assetURL: getEtonaImage(etona.id),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
