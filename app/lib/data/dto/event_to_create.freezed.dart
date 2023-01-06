// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_to_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventToCreate _$EventToCreateFromJson(Map<String, dynamic> json) {
  return _EventToCreate.fromJson(json);
}

/// @nodoc
mixin _$EventToCreate {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventToCreateCopyWith<EventToCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventToCreateCopyWith<$Res> {
  factory $EventToCreateCopyWith(
          EventToCreate value, $Res Function(EventToCreate) then) =
      _$EventToCreateCopyWithImpl<$Res, EventToCreate>;
  @useResult
  $Res call(
      {String name, String? description, DateTime? date, List<Tag>? tags});
}

/// @nodoc
class _$EventToCreateCopyWithImpl<$Res, $Val extends EventToCreate>
    implements $EventToCreateCopyWith<$Res> {
  _$EventToCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventToCreateCopyWith<$Res>
    implements $EventToCreateCopyWith<$Res> {
  factory _$$_EventToCreateCopyWith(
          _$_EventToCreate value, $Res Function(_$_EventToCreate) then) =
      __$$_EventToCreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String? description, DateTime? date, List<Tag>? tags});
}

/// @nodoc
class __$$_EventToCreateCopyWithImpl<$Res>
    extends _$EventToCreateCopyWithImpl<$Res, _$_EventToCreate>
    implements _$$_EventToCreateCopyWith<$Res> {
  __$$_EventToCreateCopyWithImpl(
      _$_EventToCreate _value, $Res Function(_$_EventToCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_EventToCreate(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventToCreate implements _EventToCreate {
  _$_EventToCreate(
      {required this.name,
      required this.description,
      required this.date,
      required final List<Tag>? tags})
      : _tags = tags;

  factory _$_EventToCreate.fromJson(Map<String, dynamic> json) =>
      _$$_EventToCreateFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime? date;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventToCreate(name: $name, description: $description, date: $date, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventToCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, date,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventToCreateCopyWith<_$_EventToCreate> get copyWith =>
      __$$_EventToCreateCopyWithImpl<_$_EventToCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToCreateToJson(
      this,
    );
  }
}

abstract class _EventToCreate implements EventToCreate {
  factory _EventToCreate(
      {required final String name,
      required final String? description,
      required final DateTime? date,
      required final List<Tag>? tags}) = _$_EventToCreate;

  factory _EventToCreate.fromJson(Map<String, dynamic> json) =
      _$_EventToCreate.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  List<Tag>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_EventToCreateCopyWith<_$_EventToCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
