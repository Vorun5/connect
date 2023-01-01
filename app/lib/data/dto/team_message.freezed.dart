// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamMessage _$TeamMessageFromJson(Map<String, dynamic> json) {
  return _TeamMessage.fromJson(json);
}

/// @nodoc
mixin _$TeamMessage {
  int get userId => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamMessageCopyWith<TeamMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamMessageCopyWith<$Res> {
  factory $TeamMessageCopyWith(
          TeamMessage value, $Res Function(TeamMessage) then) =
      _$TeamMessageCopyWithImpl<$Res, TeamMessage>;
  @useResult
  $Res call({int userId, int teamId, String text, DateTime date});
}

/// @nodoc
class _$TeamMessageCopyWithImpl<$Res, $Val extends TeamMessage>
    implements $TeamMessageCopyWith<$Res> {
  _$TeamMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? teamId = null,
    Object? text = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamMessageCopyWith<$Res>
    implements $TeamMessageCopyWith<$Res> {
  factory _$$_TeamMessageCopyWith(
          _$_TeamMessage value, $Res Function(_$_TeamMessage) then) =
      __$$_TeamMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int teamId, String text, DateTime date});
}

/// @nodoc
class __$$_TeamMessageCopyWithImpl<$Res>
    extends _$TeamMessageCopyWithImpl<$Res, _$_TeamMessage>
    implements _$$_TeamMessageCopyWith<$Res> {
  __$$_TeamMessageCopyWithImpl(
      _$_TeamMessage _value, $Res Function(_$_TeamMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? teamId = null,
    Object? text = null,
    Object? date = null,
  }) {
    return _then(_$_TeamMessage(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamMessage implements _TeamMessage {
  _$_TeamMessage(
      {required this.userId,
      required this.teamId,
      required this.text,
      required this.date});

  factory _$_TeamMessage.fromJson(Map<String, dynamic> json) =>
      _$$_TeamMessageFromJson(json);

  @override
  final int userId;
  @override
  final int teamId;
  @override
  final String text;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'TeamMessage(userId: $userId, teamId: $teamId, text: $text, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamMessage &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, teamId, text, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamMessageCopyWith<_$_TeamMessage> get copyWith =>
      __$$_TeamMessageCopyWithImpl<_$_TeamMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamMessageToJson(
      this,
    );
  }
}

abstract class _TeamMessage implements TeamMessage {
  factory _TeamMessage(
      {required final int userId,
      required final int teamId,
      required final String text,
      required final DateTime date}) = _$_TeamMessage;

  factory _TeamMessage.fromJson(Map<String, dynamic> json) =
      _$_TeamMessage.fromJson;

  @override
  int get userId;
  @override
  int get teamId;
  @override
  String get text;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_TeamMessageCopyWith<_$_TeamMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
