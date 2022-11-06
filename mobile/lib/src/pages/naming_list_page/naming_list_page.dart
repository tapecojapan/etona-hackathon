import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NamingListPage extends HookConsumerWidget {
  const NamingListPage({
    Key? key,
    required this.playId,
  }) : super(key: key);

  final String playId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final playsState = ref.watch(playsProvider(playId));
    final playsController = ref.watch(playsProvider(playId).notifier);
    final godparentEtonas = playsController.getGodparentEtonas();
    final namingState = ref.watch(etonasNamingProvider(playId));
    final namingController = ref.read(etonasNamingProvider(playId).notifier);
    final etonas = namingState.etonas;
    const count = 60000;
    final stopwatchState = ref.watch(stopwatchProvider(count));
    final milliseconds = count - stopwatchState.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).ceil();
    final timeUp = useState(false);

    Future<void> onStart() async {
      /*GoRouter.of(context)
       .go('/naming-list/waiting-for-player');*/
      //GoRouter.of(context).go('/naming-list/memorize');
      isLoading.value = true;
      await namingController.gameStart(context);
      isLoading.value = false;
    }

    useEffect(() {
      ref.refresh(stopwatchProvider(count));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        namingController.init(godparentEtonas);
      });
      return;
    }, []);

    useEffect(() {
      () async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (seconds <= 0 && !timeUp.value) {
            timeUp.value = true;
            await onStart();
          }
        });
      }();
      return;
    }, [seconds]);

    void onNamePage(Etona etona) {
      GoRouter.of(context).go('/play/$playId/naming-list/details/${etona.id}');
    }

    return Scaffold(
      backgroundColor: palette.secondary,
      body: ResponsiveLayout(
        mainAreaProminence: 0.8,
        squarishMainArea: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  '名前を付けよう😁',
                  textAlign: TextAlign.center,
                  style: ui24Black.copyWith(
                    color: palette.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  seconds < 0 ? '0' : seconds.toString(),
                  textAlign: TextAlign.center,
                  style: ui40Bold.copyWith(
                    color: palette.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: NamedEtonasLayout(
                  etonas: etonas,
                  onNamePage: onNamePage,
                ),
              ),
            ],
          ),
        ),
        rectangularMenuArea: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Column(
            children: [
              ShadowLayout(
                child: OutlinedTextButton(
                  sizeType: SizeType.medium,
                  expand: false,
                  width: 184,
                  text: 'スタート',
                  loading: isLoading.value,
                  onPressed: () async {
                    await showCustomDialog<void>(
                      context: context,
                      widget: CustomModal(
                        title: '残り時間をスキップ\nしますか？🤔️',
                        description: '全員がスキップすると残り時間に関わらずスタートします。',
                        leftButtonText: 'まだ待って',
                        rightButtonText: 'はい！',
                        onTapRight: onStart,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
