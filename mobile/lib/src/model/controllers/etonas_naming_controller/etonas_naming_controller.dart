import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'etonas_naming_state.dart';

final etonasNamingProvider = StateNotifierProvider.autoDispose
    .family<EtonasNamingController, EtonasNamingState, String>(
        EtonasNamingController.new);

class EtonasNamingController extends StateNotifier<EtonasNamingState> {
  EtonasNamingController(this._ref, this._playId) : super(EtonasNamingState()) {
    () async {
      //await init();
    }();
  }

  final AutoDisposeStateNotifierProviderRef<EtonasNamingController,
      EtonasNamingState> _ref;
  final String _playId;

  /*Future<void> init() async {
    const etona = '';
    final randomEtonas = originalEtonas..shuffle();
    final etonas = randomEtonas.sublist(0, 6);
    state = state.copyWith(
      etonas: etonas,
      isLoading: LoadingType.success,
    );
  }*/

  Future<void> init(List<Etona> etonas) async {
    state = state.copyWith(
      etonas: etonas,
      isLoading: LoadingType.success,
    );
  }

  void updateEtona(Etona newEtona) {
    final newEtonas = state.etonas.map((oldEtona) {
      if (oldEtona.id == newEtona.id) {
        return newEtona;
      }
      return oldEtona;
    }).toList();
    state = state.copyWith(etonas: newEtonas);
  }

  Future<void> gameStart(BuildContext context) async {
    final goRouter = GoRouter.of(context);
    final etonas = state.etonas;
    try {
      final batch = FirebaseFirestore.instance.batch();
      for (final etona in etonas) {
        final name = nullOrEmpty(etona.name) ? 'ランダムネーム' : etona.name;
        final docRef = FirebaseFirestore.instance
            .collection('plays')
            .doc(_playId)
            .collection('etonas')
            .doc(etona.docId);
        final data = <String, dynamic>{'name': name};
        batch.update(docRef, data);
      }
      await batch.commit();
      goRouter.go('/play/$_playId/waiting-for-player');
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }
}
