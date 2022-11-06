import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'password_state.dart';

export 'password_state.dart';

final passwordProvider =
    StateNotifierProvider.autoDispose<PasswordController, PasswordState>(
        PasswordController.new);

class PasswordController extends StateNotifier<PasswordState> {
  PasswordController(this._ref) : super(PasswordState()) {
    () async {}();
  }

  final AutoDisposeStateNotifierProviderRef<PasswordController, PasswordState>
      _ref;

  Future<String?> insertPassword(BuildContext context, String password) async {
    final goRouter = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    try {
      final data = <String, dynamic>{
        'hostId': user.uid,
        'password': password,
        'playerIds': [user.uid],
        'createdAt': FieldValue.serverTimestamp(),
      };
      final docRef =
          await FirebaseFirestore.instance.collection('plays').add(data);
      debugPrint('success');
      goRouter.go('/matching/${docRef.id}');
      return 'success';
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
      showSnackBar(
        messenger: messenger,
        text: 'しばらく待ってからもう一度お試しください',
      );
      return null;
    }
  }

  Future<String?> pushPlayer(BuildContext context, String password) async {
    final goRouter = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    try {
      final data = <String, dynamic>{
        'playerIds': FieldValue.arrayUnion(<String>[user.uid]),
        //'playerIds': FieldValue.arrayUnion(<String>['e2S1fhMHV0dkdujTiukd']),
      };
      final snapshot = await FirebaseFirestore.instance
          .collection('plays')
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
      if (snapshot.docs.isEmpty) {
        showSnackBar(
          messenger: messenger,
          text: '合言葉が正しくありません。',
        );
        return null;
      }
      final docRef = snapshot.docs[0].reference;
      await docRef.update(data);

      debugPrint('success');
      goRouter.go('/matching/${docRef.id}');
      return 'success';
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
      showSnackBar(
        messenger: messenger,
        text: 'しばらく待ってからもう一度お試しください',
      );
      return null;
    }
  }
}
