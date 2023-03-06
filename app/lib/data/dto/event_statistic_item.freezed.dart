// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_statistic_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventStatisticItem _$EventStatisticItemFromJson(Map<String, dynamic> json) {
  return _EventStatisticItem.fromJson(json);
}

/// @nodoc
mixin _$EventStatisticItem {
  bool get entryAfterAdminApproval => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventStatisticItemCopyWith<EventStatisticItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStatisticItemCopyWith<$Res> {
  factory $EventStatisticItemCopyWith(
          EventStatisticItem value, $Res Function(EventStatisticItem) then) =
      _$EventStatisticItemCopyWithImpl<$Res, EventStatisticItem>;
  @useResult
  $Res call({bool entryAfterAdminApproval, int count});
}

/// @nodoc
class _$EventStatisticItemCopyWithImpl<$Res, $Val extends EventStatisticItem>
    implements $EventStatisticItemCopyWith<$Res> {
  _$EventStatisticItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryAfterAdminApproval = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventStatisticItemCopyWith<$Res>
    implements $EventStatisticItemCopyWith<$Res> {
  factory _$$_EventStatisticItemCopyWith(_$_EventStatisticItem value,
          $Res Function(_$_EventStatisticItem) then) =
      __$$_EventStatisticItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool entryAfterAdminApproval, int count});
}

/// @nodoc
class __$$_EventStatisticItemCopyWithImpl<$Res>
    extends _$EventStatisticItemCopyWithImpl<$Res, _$_EventStatisticItem>
    implements _$$_EventStatisticItemCopyWith<$Res> {
  __$$_EventStatisticItemCopyWithImpl(
      _$_EventStatisticItem _value, $Res Function(_$_EventStatisticItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryAfterAdminApproval = null,
    Object? count = null,
  }) {
    return _then(_$_EventStatisticItem(
      entryAfterAdminApproval: null == entryAfterAdminApproval
          ? _value.entryAfterAdminApproval
          : entryAfterAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventStatisticItem implements _EventStatisticItem {
  _$_EventStatisticItem(
      {required this.entryAfterAdminApproval, required this.count});

  factory _$_EventStatisticItem.fromJson(Map<String, dynamic> json) =>
      _$$_EventStatisticItemFromJson(json);

  @override
  final bool entryAfterAdminApproval;
  @override
  final int count;

  @override
  String toString() {
    return 'EventStatisticItem(entryAfterAdminApproval: $entryAfterAdminApproval, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventStatisticItem &&
            (identical(
                    other.entryAfterAdminApproval, entryAfterAdminApproval) ||
                other.entryAfterAdminApproval == entryAfterAdminApproval) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entryAfterAdminApproval, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventStatisticItemCopyWith<_$_EventStatisticItem> get copyWith =>
      __$$_EventStatisticItemCopyWithImpl<_$_EventStatisticItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventStatisticItemToJson(
      this,
    );
  }
}

abstract class _EventStatisticItem implements EventStatisticItem {
  factory _EventStatisticItem(
      {required final bool entryAfterAdminApproval,
      required final int count}) = _$_EventStatisticItem;

  factory _EventStatisticItem.fromJson(Map<String, dynamic> json) =
      _$_EventStatisticItem.fromJson;

  @override
  bool get entryAfterAdminApproval;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_EventStatisticItemCopyWith<_$_EventStatisticItem> get copyWith =>
      throw _privateConstructorUsedError;
}
