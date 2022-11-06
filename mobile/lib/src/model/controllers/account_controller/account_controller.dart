import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'account_state.dart';

final accountProvider = StateNotifierProvider<AccountController, AccountState>(
    AccountController.new);

class AccountController extends StateNotifier<AccountState> {
  AccountController(this._ref) : super(AccountState()) {
    () async {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          debugPrint('User is currently signed out!');
          state = state.copyWith(
            user: null,
            account: null,
          );
          await FirebaseAuth.instance.signInAnonymously();
        } else {
          debugPrint('User is signed in!');
          state = state.copyWith(isLoading: LoadingType.loading);
          state = state.copyWith(
            user: user,
          );
          await fetchAccount();
        }
        state = state.copyWith(isLoading: LoadingType.success);
      });
    }();
  }

  final StateNotifierProviderRef<AccountController, AccountState> _ref;

  Future<void> fetchAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('players')
          .doc(user.uid)
          .get();
      if (snapshot.exists && snapshot.data() != null) {
        final account =
            Account.fromJson(snapshot.data()!).copyWith(id: snapshot.id);
        state = state.copyWith(account: account);
      } else {
        await insertAccount();
      }
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
      return;
    }
  }

  Future<void> insertAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    try {
      final data = <String, dynamic>{
        'favoriteEtona': 'etn1',
        'updatedAt': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      };
      final docRef = await FirebaseFirestore.instance
          .collection('players')
          .doc(user.uid)
          .set(data);
      debugPrint('success');
      final account = Account(
        id: user.uid,
        favoriteEtona: 'etn1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      state = state.copyWith(account: account);
    } on Exception catch (e) {
      debugPrint('Exception');
      debugPrint(e.toString());
    }
  }
}
