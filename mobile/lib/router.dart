import 'package:etona/src/model/model.dart';
import 'package:etona/src/pages/friend_match_page/friend_match_page.dart';
import 'package:etona/src/pages/main_menu_page/main_menu_page.dart';
import 'package:etona/src/pages/manual_page/manual_page.dart';
import 'package:etona/src/pages/matching_page/matching_page.dart';
import 'package:etona/src/pages/my_page/my_page.dart';
import 'package:etona/src/pages/my_page/settings_page/settings_page.dart';
import 'package:etona/src/pages/naming_list_page/interim_result_page/interim_result_page.dart';
import 'package:etona/src/pages/naming_list_page/memorize_page/memorize_page.dart';
import 'package:etona/src/pages/naming_list_page/name_details_page/name_details_page.dart';
import 'package:etona/src/pages/naming_list_page/naming_list_page.dart';
import 'package:etona/src/pages/naming_list_page/play_choice_page/play_choice_page.dart';
import 'package:etona/src/pages/naming_list_page/result_page/result_page.dart';
import 'package:etona/src/pages/naming_list_page/waiting_for_player_page/waiting_for_player_page.dart';
import 'package:etona/src/style/my_transition.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,

      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) =>
                const MainMenuPage(key: Key('main menu')),
            routes: [
              GoRoute(
                path: 'friend-match',
                pageBuilder: (context, state) => buildMyTransition(
                  color: palette.backgroundPlaySession,
                  child: const FriendMatchPage(
                    key: Key('friend-match'),
                  ),
                ),
              ),
              GoRoute(
                path: 'manual',
                pageBuilder: (context, state) {
                  final isPlay = state.extra as bool?;
                  return buildMyTransition(
                    color: palette.backgroundPlaySession,
                    child: ManualPage(
                      key: const Key('manual'),
                      isPlay: isPlay == true,
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'my-page',
                pageBuilder: (context, state) => buildMyTransition(
                  color: palette.backgroundPlaySession,
                  child: const MyPage(
                    key: Key('manual'),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'settings',
                    pageBuilder: (context, state) => buildMyTransition(
                      color: palette.backgroundPlaySession,
                      child: const SettingsPage(
                        key: Key('my-page setting'),
                      ),
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: 'matching/:playId',
                pageBuilder: (context, state) {
                  final playId = state.params['playId']!;
                  return buildMyTransition(
                    color: palette.backgroundPlaySession,
                    child: MatchingPage(
                      key: const Key('matching'),
                      playId: playId,
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'play/:playId',
                redirect: (state) {
                  final playId = state.params['playId']!;
                  return '/play/$playId/naming-list';
                },
                routes: [
                  GoRoute(
                    path: 'naming-list',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      return buildMyTransition(
                        color: palette.backgroundPlaySession,
                        child: NamingListPage(
                          key: const Key('naming-list'),
                          playId: playId,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'details/:etonaId',
                        pageBuilder: (context, state) {
                          final playId = state.params['playId']!;
                          final etonaId = state.params['etonaId']!;
                          final etonas =
                              ref.read(etonasNamingProvider(playId)).etonas;
                          final etona =
                              etonas.singleWhere((e) => e.id == etonaId);
                          return buildMyTransition(
                            child: NameDetailsPage(
                              etona: etona,
                              key: const Key('naming-list details'),
                              playId: playId,
                            ),
                            color: palette.backgroundPlaySession,
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'waiting-for-player',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      return buildMyTransition(
                        child: WaitingForPlayerPage(
                          key: const Key('naming-list waiting-for-player'),
                          playId: playId,
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'memorize',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      return buildMyTransition(
                        child: MemorizePage(
                          key: const Key('naming-list memorize'),
                          playId: playId,
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'play-choice/:orderId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final orderId = int.parse(state.params['orderId']!);
                      final etonas = ref.read(playsProvider(playId)).etonas;
                      final playsController =
                          ref.read(playsProvider(playId).notifier);
                      final etona =
                          etonas.singleWhere((e) => e.order == orderId);
                      final questionEtonas =
                          playsController.getQuestionEtonas(etona);
                      final questionNames =
                          playsController.getQuestionNames(etona);
                      return buildMyTransition(
                        child: PlayChoicePage(
                          etona: etona,
                          playId: playId,
                          order: orderId,
                          etonas: questionEtonas,
                          names: questionNames,
                          key: const Key('naming-list play-choice'),
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'interim-result/:orderId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final orderId = int.parse(state.params['orderId']!);
                      return buildMyTransition(
                        color: palette.backgroundPlaySession,
                        child: InterimResultPage(
                          key: const Key(
                              'naming-list play-choice interim-result'),
                          playId: playId,
                          order: orderId,
                        ),
                      );
                    },
                  ),
                  GoRoute(
                      path: 'result',
                      pageBuilder: (context, state) {
                        final playId = state.params['playId']!;
                        return buildMyTransition(
                          color: palette.backgroundPlaySession,
                          child: ResultPage(
                            key: const Key('naming-list result'),
                            playId: playId,
                          ),
                        );
                      }),
                ],
              ),
              /*GoRoute(
                path: 'naming-list/:playId',
                pageBuilder: (context, state) {
                  final playId = state.params['playId']!;
                  return buildMyTransition(
                    color: palette.backgroundPlaySession,
                    child: NamingListPage(
                      key: const Key('naming-list'),
                      playId: playId,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'details/:etonaId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final etonaId = state.params['etonaId']!;
                      final etonas =
                          ref.read(etonasNamingProvider(playId)).etonas;
                      final etona = etonas.singleWhere((e) => e.id == etonaId);
                      return buildMyTransition(
                        child: NameDetailsPage(
                          etona: etona,
                          key: const Key('naming-list details'),
                          playId: playId,
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'waiting-for-player',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      return buildMyTransition(
                        child: WaitingForPlayerPage(
                          key: const Key('naming-list waiting-for-player'),
                          playId: playId,
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'memorize',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      return buildMyTransition(
                        child: MemorizePage(
                          key: const Key('naming-list memorize'),
                          playId: playId,
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'play-choice/:orderId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final orderId = int.parse(state.params['orderId']!);
                      final etonas = ref.read(playsProvider(playId)).etonas;
                      final etona =
                          etonas.singleWhere((e) => e.order == orderId);
                      return buildMyTransition(
                        child: PlayChoicePage(
                          etona: etona,
                          playId: playId,
                          order: orderId,
                          key: const Key('naming-list play-choice'),
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'interim-result',
                        pageBuilder: (context, state) => buildMyTransition(
                          color: palette.backgroundPlaySession,
                          child: const InterimResultPage(
                            key: Key('naming-list play-choice interim-result'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'play-choice-name/:etonaId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final etonaId = state.params['etonaId']!;
                      final etonas =
                          ref.read(etonasNamingProvider(playId)).etonas;
                      final etona = etonas.singleWhere((e) => e.id == etonaId);
                      return buildMyTransition(
                        child: PlayChoiceNamePage(
                          etona: etona,
                          key: const Key('naming-list play-choice-name'),
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'play-choice-image/:etonaId',
                    pageBuilder: (context, state) {
                      final playId = state.params['playId']!;
                      final etonaId = state.params['etonaId']!;
                      final etonas =
                          ref.read(etonasNamingProvider(playId)).etonas;
                      final etona = etonas.singleWhere((e) => e.id == etonaId);
                      return buildMyTransition(
                        child: PlayChoiceImagePage(
                          etona: etona,
                          key: const Key('naming-list play-choice-image'),
                        ),
                        color: palette.backgroundPlaySession,
                      );
                    },
                  ),
                  GoRoute(
                    path: 'result',
                    pageBuilder: (context, state) => buildMyTransition(
                      color: palette.backgroundPlaySession,
                      child: const ResultPage(
                        key: Key('naming-list result'),
                      ),
                    ),
                  ),
                ],
              ),*/
            ]),
      ], // All the routes can be found there
    );
  },
);
