// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_to_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToUpdate _$UserToUpdateFromJson(Map<String, dynamic> json) {
  return _UserToUpdate.fromJson(json);
}

/// @nodoc
mixin _$UserToUpdate {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get backgroundImageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToUpdateCopyWith<UserToUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToUpdateCopyWith<$Res> {
  factory $UserToUpdateCopyWith(
          UserToUpdate value, $Res Function(UserToUpdate) then) =
      _$UserToUpdateCopyWithImpl<$Res, UserToUpdate>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String username,
      String name,
      String? profileImageUrl,
      String? backgroundImageUrl,
      String? description});
}

/// @nodoc
class _$UserToUpdateCopyWithImpl<$Res, $Val extends UserToUpdate>
    implements $UserToUpdateCopyWith<$Res> {
  _$UserToUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: freezed == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserToUpdateCopyWith<$Res>
    implements $UserToUpdateCopyWith<$Res> {
  factory _$$_UserToUpdateCopyWith(
          _$_UserToUpdate value, $Res Function(_$_UserToUpdate) then) =
      __$$_UserToUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String username,
      String name,
      String? profileImageUrl,
      String? backgroundImageUrl,
      String? description});
}

/// @nodoc
class __$$_UserToUpdateCopyWithImpl<$Res>
    extends _$UserToUpdateCopyWithImpl<$Res, _$_UserToUpdate>
    implements _$$_UserToUpdateCopyWith<$Res> {
  __$$_UserToUpdateCopyWithImpl(
      _$_UserToUpdate _value, $Res Function(_$_UserToUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_UserToUpdate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: freezed == backgroundImageUrl
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToUpdate implements _UserToUpdate {
  _$_UserToUpdate(
      {@JsonKey(name: '_id') required this.id,
      required this.username,
      required this.name,
      required this.profileImageUrl,
      required this.backgroundImageUrl,
      required this.description});

  factory _$_UserToUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_UserToUpdateFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String username;
  @override
  final String name;
  @override
  final String? profileImageUrl;
  @override
  final String? backgroundImageUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'UserToUpdate(id: $id, username: $username, name: $name, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToUpdate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.backgroundImageUrl, backgroundImageUrl) ||
                other.backgroundImageUrl == backgroundImageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, name,
      profileImageUrl, backgroundImageUrl, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserToUpdateCopyWith<_$_UserToUpdate> get copyWith =>
      __$$_UserToUpdateCopyWithImpl<_$_UserToUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToUpdateToJson(
      this,
    );
  }
}

abstract class _UserToUpdate implements UserToUpdate {
  factory _UserToUpdate(
      {@JsonKey(name: '_id') required final String? id,
      required final String username,
      required final String name,
      required final String? profileImageUrl,
      required final String? backgroundImageUrl,
      required final String? description}) = _$_UserToUpdate;

  factory _UserToUpdate.fromJson(Map<String, dynamic> json) =
      _$_UserToUpdate.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get username;
  @override
  String get name;
  @override
  String? get profileImageUrl;
  @override
  String? get backgroundImageUrl;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_UserToUpdateCopyWith<_$_UserToUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
