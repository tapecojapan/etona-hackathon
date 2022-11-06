// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plays_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaysState {
  Room? get room => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;
  List<Etona> get etonas => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      get roomSubscription => throw _privateConstructorUsedError;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      get etonasSubscription => throw _privateConstructorUsedError;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      get answersSubscription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaysStateCopyWith<PlaysState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaysStateCopyWith<$Res> {
  factory $PlaysStateCopyWith(
          PlaysState value, $Res Function(PlaysState) then) =
      _$PlaysStateCopyWithImpl<$Res>;
  $Res call(
      {Room? room,
      List<Player> players,
      List<Etona> etonas,
      List<Answer> answers,
      StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
          roomSubscription,
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          etonasSubscription,
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          answersSubscription});

  $RoomCopyWith<$Res>? get room;
}

/// @nodoc
class _$PlaysStateCopyWithImpl<$Res> implements $PlaysStateCopyWith<$Res> {
  _$PlaysStateCopyWithImpl(this._value, this._then);

  final PlaysState _value;
  // ignore: unused_field
  final $Res Function(PlaysState) _then;

  @override
  $Res call({
    Object? room = freezed,
    Object? players = freezed,
    Object? etonas = freezed,
    Object? answers = freezed,
    Object? roomSubscription = freezed,
    Object? etonasSubscription = freezed,
    Object? answersSubscription = freezed,
  }) {
    return _then(_value.copyWith(
      room: room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room?,
      players: players == freezed
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      etonas: etonas == freezed
          ? _value.etonas
          : etonas // ignore: cast_nullable_to_non_nullable
              as List<Etona>,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      roomSubscription: roomSubscription == freezed
          ? _value.roomSubscription
          : roomSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?,
      etonasSubscription: etonasSubscription == freezed
          ? _value.etonasSubscription
          : etonasSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?,
      answersSubscription: answersSubscription == freezed
          ? _value.answersSubscription
          : answersSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?,
    ));
  }

  @override
  $RoomCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlaysStateCopyWith<$Res>
    implements $PlaysStateCopyWith<$Res> {
  factory _$$_PlaysStateCopyWith(
          _$_PlaysState value, $Res Function(_$_PlaysState) then) =
      __$$_PlaysStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Room? room,
      List<Player> players,
      List<Etona> etonas,
      List<Answer> answers,
      StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
          roomSubscription,
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          etonasSubscription,
      StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          answersSubscription});

  @override
  $RoomCopyWith<$Res>? get room;
}

/// @nodoc
class __$$_PlaysStateCopyWithImpl<$Res> extends _$PlaysStateCopyWithImpl<$Res>
    implements _$$_PlaysStateCopyWith<$Res> {
  __$$_PlaysStateCopyWithImpl(
      _$_PlaysState _value, $Res Function(_$_PlaysState) _then)
      : super(_value, (v) => _then(v as _$_PlaysState));

  @override
  _$_PlaysState get _value => super._value as _$_PlaysState;

  @override
  $Res call({
    Object? room = freezed,
    Object? players = freezed,
    Object? etonas = freezed,
    Object? answers = freezed,
    Object? roomSubscription = freezed,
    Object? etonasSubscription = freezed,
    Object? answersSubscription = freezed,
  }) {
    return _then(_$_PlaysState(
      room: room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room?,
      players: players == freezed
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      etonas: etonas == freezed
          ? _value._etonas
          : etonas // ignore: cast_nullable_to_non_nullable
              as List<Etona>,
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      roomSubscription: roomSubscription == freezed
          ? _value.roomSubscription
          : roomSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?,
      etonasSubscription: etonasSubscription == freezed
          ? _value.etonasSubscription
          : etonasSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?,
      answersSubscription: answersSubscription == freezed
          ? _value.answersSubscription
          : answersSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?,
    ));
  }
}

/// @nodoc

class _$_PlaysState extends _PlaysState with DiagnosticableTreeMixin {
  _$_PlaysState(
      {this.room,
      final List<Player> players = const <Player>[],
      final List<Etona> etonas = const <Etona>[],
      final List<Answer> answers = const <Answer>[],
      this.roomSubscription,
      this.etonasSubscription,
      this.answersSubscription})
      : _players = players,
        _etonas = etonas,
        _answers = answers,
        super._();

  @override
  final Room? room;
  final List<Player> _players;
  @override
  @JsonKey()
  List<Player> get players {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<Etona> _etonas;
  @override
  @JsonKey()
  List<Etona> get etonas {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_etonas);
  }

  final List<Answer> _answers;
  @override
  @JsonKey()
  List<Answer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      roomSubscription;
  @override
  final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      etonasSubscription;
  @override
  final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      answersSubscription;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaysState(room: $room, players: $players, etonas: $etonas, answers: $answers, roomSubscription: $roomSubscription, etonasSubscription: $etonasSubscription, answersSubscription: $answersSubscription)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaysState'))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('etonas', etonas))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('roomSubscription', roomSubscription))
      ..add(DiagnosticsProperty('etonasSubscription', etonasSubscription))
      ..add(DiagnosticsProperty('answersSubscription', answersSubscription));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaysState &&
            const DeepCollectionEquality().equals(other.room, room) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._etonas, _etonas) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other.roomSubscription, roomSubscription) &&
            const DeepCollectionEquality()
                .equals(other.etonasSubscription, etonasSubscription) &&
            const DeepCollectionEquality()
                .equals(other.answersSubscription, answersSubscription));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(room),
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_etonas),
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(roomSubscription),
      const DeepCollectionEquality().hash(etonasSubscription),
      const DeepCollectionEquality().hash(answersSubscription));

  @JsonKey(ignore: true)
  @override
  _$$_PlaysStateCopyWith<_$_PlaysState> get copyWith =>
      __$$_PlaysStateCopyWithImpl<_$_PlaysState>(this, _$identity);
}

abstract class _PlaysState extends PlaysState {
  factory _PlaysState(
      {final Room? room,
      final List<Player> players,
      final List<Etona> etonas,
      final List<Answer> answers,
      final StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
          roomSubscription,
      final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          etonasSubscription,
      final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
          answersSubscription}) = _$_PlaysState;
  _PlaysState._() : super._();

  @override
  Room? get room;
  @override
  List<Player> get players;
  @override
  List<Etona> get etonas;
  @override
  List<Answer> get answers;
  @override
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      get roomSubscription;
  @override
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      get etonasSubscription;
  @override
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      get answersSubscription;
  @override
  @JsonKey(ignore: true)
  _$$_PlaysStateCopyWith<_$_PlaysState> get copyWith =>
      throw _privateConstructorUsedError;
}
