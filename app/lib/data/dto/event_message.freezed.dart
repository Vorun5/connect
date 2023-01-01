// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventMessage _$EventMessageFromJson(Map<String, dynamic> json) {
  return _EventMessage.fromJson(json);
}

/// @nodoc
mixin _$EventMessage {
  String get userId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventMessageCopyWith<EventMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventMessageCopyWith<$Res> {
  factory $EventMessageCopyWith(
          EventMessage value, $Res Function(EventMessage) then) =
      _$EventMessageCopyWithImpl<$Res, EventMessage>;
  @useResult
  $Res call({String userId, String eventId, String text, DateTime date});
}

/// @nodoc
class _$EventMessageCopyWithImpl<$Res, $Val extends EventMessage>
    implements $EventMessageCopyWith<$Res> {
  _$EventMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
    Object? text = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_EventMessageCopyWith<$Res>
    implements $EventMessageCopyWith<$Res> {
  factory _$$_EventMessageCopyWith(
          _$_EventMessage value, $Res Function(_$_EventMessage) then) =
      __$$_EventMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String eventId, String text, DateTime date});
}

/// @nodoc
class __$$_EventMessageCopyWithImpl<$Res>
    extends _$EventMessageCopyWithImpl<$Res, _$_EventMessage>
    implements _$$_EventMessageCopyWith<$Res> {
  __$$_EventMessageCopyWithImpl(
      _$_EventMessage _value, $Res Function(_$_EventMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
    Object? text = null,
    Object? date = null,
  }) {
    return _then(_$_EventMessage(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_EventMessage implements _EventMessage {
  _$_EventMessage(
      {required this.userId,
      required this.eventId,
      required this.text,
      required this.date});

  factory _$_EventMessage.fromJson(Map<String, dynamic> json) =>
      _$$_EventMessageFromJson(json);

  @override
  final String userId;
  @override
  final String eventId;
  @override
  final String text;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'EventMessage(userId: $userId, eventId: $eventId, text: $text, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventMessage &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, eventId, text, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventMessageCopyWith<_$_EventMessage> get copyWith =>
      __$$_EventMessageCopyWithImpl<_$_EventMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventMessageToJson(
      this,
    );
  }
}

abstract class _EventMessage implements EventMessage {
  factory _EventMessage(
      {required final String userId,
      required final String eventId,
      required final String text,
      required final DateTime date}) = _$_EventMessage;

  factory _EventMessage.fromJson(Map<String, dynamic> json) =
      _$_EventMessage.fromJson;

  @override
  String get userId;
  @override
  String get eventId;
  @override
  String get text;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_EventMessageCopyWith<_$_EventMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
