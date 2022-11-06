import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'plays_state.dart';

final playsProvider = StateNotifierProvider.autoDispose
    .family<PlaysController, PlaysState, String>(PlaysController.new);

class PlaysController extends StateNotifier<PlaysState> {
  PlaysController(this._ref, this._playId) : super(PlaysState()) {
    () async {
      await init();
    }();
  }

  final AutoDisposeStateNotifierProviderRef<PlaysController, PlaysState> _ref;
  final String _playId;

  @override
  void dispose() {
    if (mounted) {
      cancelSubscription(state.roomSubscription);
      cancelSubscription(state.etonasSubscription);
      cancelSubscription(state.answersSubscription);
    }
    super.dispose();
  }

  void cancelSubscription(StreamSubscription<dynamic>? subscription) {
    if (subscription != null) {
      subscription.cancel();
    }
  }

  Future<void> init() async {
    roomSubscribe();
    etonasSubscribe();
    answersSubscribe();
  }

  void roomSubscribe() {
    try {
      final playsRef =
          FirebaseFirestore.instance.collection('plays').doc(_playId);
      final roomSubscription = playsRef.snapshots().listen((querySnapshot) {
        if (!querySnapshot.exists) {
          return;
        }
        final data = querySnapshot.data();
        if (data == null) {
          return;
        }
        final room = Room.fromJson(data).copyWith(id: querySnapshot.id);
        if (mounted) {
          state = state.copyWith(room: room);
        }
        fetchPlayers(room.playerIds);
      });
      if (mounted) {
        state = state.copyWith(
          roomSubscription: roomSubscription,
        );
      }
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }

  void etonasSubscribe() {
    try {
      final etonasRef = FirebaseFirestore.instance
          .collection('plays')
          .doc(_playId)
          .collection('etonas');
      final etonasSubscription = etonasRef.snapshots().listen((querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          return;
        }
        final etonas = querySnapshot.docs
            .map((doc) => Etona.fromJson(doc.data()).copyWith(docId: doc.id))
            .toList();
        if (mounted) {
          state = state.copyWith(etonas: etonas);
        }
      });
      if (mounted) {
        state = state.copyWith(
          etonasSubscription: etonasSubscription,
        );
      }
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }

  void answersSubscribe() {
    try {
      final ref = FirebaseFirestore.instance
          .collection('plays')
          .doc(_playId)
          .collection('answers');
      final subscription = ref.snapshots().listen((querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          return;
        }
        final answers = querySnapshot.docs
            .map((doc) => Answer.fromJson(doc.data()).copyWith(id: doc.id))
            .toList();
        if (mounted) {
          state = state.copyWith(answers: answers);
        }
      });
      if (mounted) {
        state = state.copyWith(
          answersSubscription: subscription,
        );
      }
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }

  Future<void> fetchPlayers(List<String>? playerIds) async {
    if (playerIds == null) {
      return;
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('players')
          .where(FieldPath.documentId, whereIn: playerIds)
          .get();
      if (querySnapshot.docs.isEmpty) {
        return;
      }
      final players = querySnapshot.docs
          .map((doc) => Player.fromJson(doc.data()).copyWith(id: doc.id))
          .toList();
      if (mounted) {
        state = state.copyWith(players: players);
      }
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }

  List<Player> getPlayersWithoutMe() {
    final account = _ref.watch(accountProvider).account;
    if (mounted) {
      final players =
          state.players.where((player) => player.id != account?.id).toList();
      return players;
    }
    return [];
  }

  List<Etona> getGodparentEtonas() {
    final account = _ref.watch(accountProvider).account;
    if (mounted) {
      final godparentEtonas = state.etonas
          .where((etona) => etona.godparentId == account?.id)
          .toList();
      return godparentEtonas;
    }
    return [];
  }

  List<Player> getNamingCompletedPlayers() {
    final account = _ref.watch(accountProvider).account;
    if (mounted) {
      final etonas = state.etonas;
      final players = state.players;

      final namedEtonas = etonas
          .where((etona) =>
              !nullOrEmpty(etona.name) && etona.godparentId != account?.id)
          .toList();
      final completedPlayerIds = namedEtonas.map((e) => e.godparentId).toList()
        ..toSet().toList();

      final completedPlayers = players
          .where((player) => completedPlayerIds.contains(player.id))
          .toList();
      return completedPlayers;
    }
    return [];
  }

  List<Etona> getNamedEtonas() {
    if (mounted) {
      final etonas =
          state.etonas.where((etona) => !nullOrEmpty(etona.name)).toList();
      return etonas;
    }
    return [];
  }

  List<Etona> getQuestionEtonas(Etona etona) {
    if (mounted) {
      final fakeEtonas = state.etonas.where((e) => e.id != etona.id).toList()
        ..shuffle();
      if (fakeEtonas.length < 5) {
        return [];
      }
      final etonas = [...fakeEtonas.sublist(0, 5), etona]..shuffle();

      return etonas;
    }
    return [];
  }

  List<String> getQuestionNames(Etona etona) {
    if (mounted) {
      final masterFakes =
          masterRandomNames[etona.id]?.where((n) => n != etona.name).toList() ??
              [];
      final fakes = masterFakes..shuffle();
      if (fakes.length < 3) {
        return [];
      }
      final names = [...fakes.sublist(0, 3), etona.name ?? '']..shuffle();
      return names;
    }
    return [];
  }

  List<Answer> getCurrentAnswers(int order) {
    if (mounted) {
      try {
        final etona = state.etonas.firstWhere((e) => e.order == order);
        final answers =
            state.answers.where((a) => a.etonaId == etona.id).toList()
              ..sort((a, b) {
                if (isCollectAnswer(a) && !isCollectAnswer(b)) {
                  return -1;
                }
                return (a.tapMilliseconds ?? 10000)
                    .compareTo(b.tapMilliseconds ?? 10000);
              });
        return answers;
      } on Exception catch (e) {
        debugPrint('Exception');
        debugPrint(e.toString());
      }
    }
    return [];
  }

  Player? getPlayer(String? playerId) {
    if (mounted) {
      try {
        final player = state.players.firstWhere((p) => p.id == playerId);
        return player;
      } on Exception catch (e) {
        debugPrint('Exception');
        debugPrint(e.toString());
      }
    }
    return null;
  }

  bool isCollectAnswer(Answer answer) {
    if (mounted) {
      try {
        final etona = state.etonas.firstWhere((e) => e.id == answer.etonaId);
        if (etona.type == 0) {
          return answer.imageAnswer == etona.id;
        } else {
          return answer.nameAnswer == etona.name;
        }
      } on Exception catch (e) {
        debugPrint('Exception');
        debugPrint(e.toString());
      }
    }
    return false;
  }

  Answer? getAnswer(int order) {
    try {
      final account = _ref.read(accountProvider).account;
      final answers = getCurrentAnswers(order);
      final answer = answers.firstWhere((a) => a.playerId == account?.id);
      return answer;
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
    return null;
  }

  int? getInterimRank(int order, String? playerId) {
    if (mounted) {
      try {
        final answers = getCurrentAnswers(order);
        /*if (answers.length < 4) {
          return null;
        }*/

        final index = answers
            .indexWhere((a) => a.playerId == playerId && isCollectAnswer(a));
        if (index == -1) {
          return null;
        }

        return index;
      } on Exception catch (e) {
        debugPrint('Exception');
        debugPrint(e.toString());
      }
    }
    return null;
  }

  int getVictoryCount(String? playerId) {
    final rankings = state.etonas.map((e) {
      final rank = getInterimRank(e.order!, playerId);

      return rank;
    }).toList();

    var count = 0;
    for (final ranking in rankings) {
      if (ranking == 0) {
        count += 1;
      }
    }
    return count;
  }

  int getRanking() {
    final playersRanking = state.players.map((p) {
      final count = getVictoryCount(p.id);
      return VictoryCount(playerId: p.id, count: count);
    }).toList()
      ..sort((a, b) => b.count!.compareTo(a.count!));

    final account = _ref.read(accountProvider).account;
    final ranking = playersRanking.indexWhere((p) => p.playerId == account?.id);

    return ranking + 1;
  }

  Future<void> insertAnswer({
    required BuildContext context,
    required Answer answer,
    required int order,
  }) async {
    final goRouter = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    try {
      ///todo
      /*final batch = FirebaseFirestore.instance.batch();
      var tapMilliseconds = answer.tapMilliseconds ?? 0;
      final players = [...state.players]..shuffle();
      for (final player in players) {
        final data = <String, dynamic>{
          'etonaId': answer.etonaId,
          'playerId': player.id,
          'tapMilliseconds': tapMilliseconds,
          'imageAnswer': answer.imageAnswer,
          'nameAnswer': answer.nameAnswer,
          'createdAt': FieldValue.serverTimestamp(),
        };
        tapMilliseconds = tapMilliseconds + 300;
        final docRef = FirebaseFirestore.instance
            .collection('plays')
            .doc(_playId)
            .collection('answers')
            .doc();
        batch.set(docRef, data);
      }
      await batch.commit();*/
      final data = <String, dynamic>{
        'etonaId': answer.etonaId,
        'playerId': answer.playerId,
        'tapMilliseconds': answer.tapMilliseconds,
        'imageAnswer': answer.imageAnswer,
        'nameAnswer': answer.nameAnswer,
        'createdAt': FieldValue.serverTimestamp(),
      };
      final docRef = await FirebaseFirestore.instance
          .collection('plays')
          .doc(_playId)
          .collection('answers')
          .add(data);
      debugPrint('success');
      goRouter.go('/play/$_playId/interim-result/$order');
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
      showSnackBar(
        messenger: messenger,
        text: '通信環境をご確認ください',
      );
    }
  }
}
