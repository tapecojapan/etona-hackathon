import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etona/src/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plays_state.freezed.dart';

@freezed
class PlaysState with _$PlaysState {
  factory PlaysState({
    Room? room,
    @Default(<Player>[]) List<Player> players,
    @Default(<Etona>[]) List<Etona> etonas,
    @Default(<Answer>[]) List<Answer> answers,
    StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
        roomSubscription,
    StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? etonasSubscription,
    StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
        answersSubscription,
  }) = _PlaysState;

  PlaysState._();
}
