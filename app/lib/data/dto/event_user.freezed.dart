// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventUser _$EventUserFromJson(Map<String, dynamic> json) {
  return _EventUser.fromJson(json);
}

/// @nodoc
mixin _$EventUser {
  User get user => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get lastTimeInChat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventUserCopyWith<EventUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventUserCopyWith<$Res> {
  factory $EventUserCopyWith(EventUser value, $Res Function(EventUser) then) =
      _$EventUserCopyWithImpl<$Res, EventUser>;
  @useResult
  $Res call({User user, DateTime date, DateTime lastTimeInChat});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$EventUserCopyWithImpl<$Res, $Val extends EventUser>
    implements $EventUserCopyWith<$Res> {
  _$EventUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? date = null,
    Object? lastTimeInChat = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTimeInChat: null == lastTimeInChat
          ? _value.lastTimeInChat
          : lastTimeInChat // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventUserCopyWith<$Res> implements $EventUserCopyWith<$Res> {
  factory _$$_EventUserCopyWith(
          _$_EventUser value, $Res Function(_$_EventUser) then) =
      __$$_EventUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, DateTime date, DateTime lastTimeInChat});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_EventUserCopyWithImpl<$Res>
    extends _$EventUserCopyWithImpl<$Res, _$_EventUser>
    implements _$$_EventUserCopyWith<$Res> {
  __$$_EventUserCopyWithImpl(
      _$_EventUser _value, $Res Function(_$_EventUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? date = null,
    Object? lastTimeInChat = null,
  }) {
    return _then(_$_EventUser(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTimeInChat: null == lastTimeInChat
          ? _value.lastTimeInChat
          : lastTimeInChat // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventUser implements _EventUser {
  _$_EventUser(
      {required this.user, required this.date, required this.lastTimeInChat});

  factory _$_EventUser.fromJson(Map<String, dynamic> json) =>
      _$$_EventUserFromJson(json);

  @override
  final User user;
  @override
  final DateTime date;
  @override
  final DateTime lastTimeInChat;

  @override
  String toString() {
    return 'EventUser(user: $user, date: $date, lastTimeInChat: $lastTimeInChat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventUser &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.lastTimeInChat, lastTimeInChat) ||
                other.lastTimeInChat == lastTimeInChat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, date, lastTimeInChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventUserCopyWith<_$_EventUser> get copyWith =>
      __$$_EventUserCopyWithImpl<_$_EventUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventUserToJson(
      this,
    );
  }
}

abstract class _EventUser implements EventUser {
  factory _EventUser(
      {required final User user,
      required final DateTime date,
      required final DateTime lastTimeInChat}) = _$_EventUser;

  factory _EventUser.fromJson(Map<String, dynamic> json) =
      _$_EventUser.fromJson;

  @override
  User get user;
  @override
  DateTime get date;
  @override
  DateTime get lastTimeInChat;
  @override
  @JsonKey(ignore: true)
  _$$_EventUserCopyWith<_$_EventUser> get copyWith =>
      throw _privateConstructorUsedError;
}
