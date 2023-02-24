// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventPreview _$EventPreviewFromJson(Map<String, dynamic> json) {
  return _EventPreview.fromJson(json);
}

/// @nodoc
mixin _$EventPreview {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int get userCount => throw _privateConstructorUsedError;
  int get teamCount => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  int? get unreadMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventPreviewCopyWith<EventPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPreviewCopyWith<$Res> {
  factory $EventPreviewCopyWith(
          EventPreview value, $Res Function(EventPreview) then) =
      _$EventPreviewCopyWithImpl<$Res, EventPreview>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? imageUrl,
      String? description,
      DateTime? date,
      int userCount,
      int teamCount,
      List<Tag> tags,
      int? unreadMessages});
}

/// @nodoc
class _$EventPreviewCopyWithImpl<$Res, $Val extends EventPreview>
    implements $EventPreviewCopyWith<$Res> {
  _$EventPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? userCount = null,
    Object? teamCount = null,
    Object? tags = null,
    Object? unreadMessages = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventPreviewCopyWith<$Res>
    implements $EventPreviewCopyWith<$Res> {
  factory _$$_EventPreviewCopyWith(
          _$_EventPreview value, $Res Function(_$_EventPreview) then) =
      __$$_EventPreviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String? imageUrl,
      String? description,
      DateTime? date,
      int userCount,
      int teamCount,
      List<Tag> tags,
      int? unreadMessages});
}

/// @nodoc
class __$$_EventPreviewCopyWithImpl<$Res>
    extends _$EventPreviewCopyWithImpl<$Res, _$_EventPreview>
    implements _$$_EventPreviewCopyWith<$Res> {
  __$$_EventPreviewCopyWithImpl(
      _$_EventPreview _value, $Res Function(_$_EventPreview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? userCount = null,
    Object? teamCount = null,
    Object? tags = null,
    Object? unreadMessages = freezed,
  }) {
    return _then(_$_EventPreview(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventPreview implements _EventPreview {
  _$_EventPreview(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.date,
      required this.userCount,
      required this.teamCount,
      required final List<Tag> tags,
      required this.unreadMessages})
      : _tags = tags;

  factory _$_EventPreview.fromJson(Map<String, dynamic> json) =>
      _$$_EventPreviewFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String? imageUrl;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final int userCount;
  @override
  final int teamCount;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final int? unreadMessages;

  @override
  String toString() {
    return 'EventPreview(id: $id, name: $name, imageUrl: $imageUrl, description: $description, date: $date, userCount: $userCount, teamCount: $teamCount, tags: $tags, unreadMessages: $unreadMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventPreview &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.teamCount, teamCount) ||
                other.teamCount == teamCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.unreadMessages, unreadMessages) ||
                other.unreadMessages == unreadMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      imageUrl,
      description,
      date,
      userCount,
      teamCount,
      const DeepCollectionEquality().hash(_tags),
      unreadMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventPreviewCopyWith<_$_EventPreview> get copyWith =>
      __$$_EventPreviewCopyWithImpl<_$_EventPreview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventPreviewToJson(
      this,
    );
  }
}

abstract class _EventPreview implements EventPreview {
  factory _EventPreview(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String? imageUrl,
      required final String? description,
      required final DateTime? date,
      required final int userCount,
      required final int teamCount,
      required final List<Tag> tags,
      required final int? unreadMessages}) = _$_EventPreview;

  factory _EventPreview.fromJson(Map<String, dynamic> json) =
      _$_EventPreview.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  int get userCount;
  @override
  int get teamCount;
  @override
  List<Tag> get tags;
  @override
  int? get unreadMessages;
  @override
  @JsonKey(ignore: true)
  _$$_EventPreviewCopyWith<_$_EventPreview> get copyWith =>
      throw _privateConstructorUsedError;
}