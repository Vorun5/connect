// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get username => throw _privateConstructorUsedError;
  String get displayUsername => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get backgroundImageUrl => throw _privateConstructorUsedError;
  Geotag? get geotag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String displayUsername,
      String name,
      String id,
      String? profileImageUrl,
      String? backgroundImageUrl,
      Geotag? geotag});

  $GeotagCopyWith<$Res>? get geotag;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? displayUsername = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? profileImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? geotag = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      displayUsername: displayUsername == freezed
          ? _value.displayUsername
          : displayUsername // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      geotag: geotag == freezed
          ? _value.geotag
          : geotag // ignore: cast_nullable_to_non_nullable
              as Geotag?,
    ));
  }

  @override
  $GeotagCopyWith<$Res>? get geotag {
    if (_value.geotag == null) {
      return null;
    }

    return $GeotagCopyWith<$Res>(_value.geotag!, (value) {
      return _then(_value.copyWith(geotag: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String displayUsername,
      String name,
      String id,
      String? profileImageUrl,
      String? backgroundImageUrl,
      Geotag? geotag});

  @override
  $GeotagCopyWith<$Res>? get geotag;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? username = freezed,
    Object? displayUsername = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? profileImageUrl = freezed,
    Object? backgroundImageUrl = freezed,
    Object? geotag = freezed,
  }) {
    return _then(_$_User(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      displayUsername: displayUsername == freezed
          ? _value.displayUsername
          : displayUsername // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: profileImageUrl == freezed
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImageUrl: backgroundImageUrl == freezed
          ? _value.backgroundImageUrl
          : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      geotag: geotag == freezed
          ? _value.geotag
          : geotag // ignore: cast_nullable_to_non_nullable
              as Geotag?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.username,
      required this.displayUsername,
      required this.name,
      required this.id,
      required this.profileImageUrl,
      required this.backgroundImageUrl,
      required this.geotag});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String username;
  @override
  final String displayUsername;
  @override
  final String name;
  @override
  final String id;
  @override
  final String? profileImageUrl;
  @override
  final String? backgroundImageUrl;
  @override
  final Geotag? geotag;

  @override
  String toString() {
    return 'User(username: $username, displayUsername: $displayUsername, name: $name, id: $id, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, geotag: $geotag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.displayUsername, displayUsername) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.backgroundImageUrl, backgroundImageUrl) &&
            const DeepCollectionEquality().equals(other.geotag, geotag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(displayUsername),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(profileImageUrl),
      const DeepCollectionEquality().hash(backgroundImageUrl),
      const DeepCollectionEquality().hash(geotag));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String username,
      required final String displayUsername,
      required final String name,
      required final String id,
      required final String? profileImageUrl,
      required final String? backgroundImageUrl,
      required final Geotag? geotag}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get username;
  @override
  String get displayUsername;
  @override
  String get name;
  @override
  String get id;
  @override
  String? get profileImageUrl;
  @override
  String? get backgroundImageUrl;
  @override
  Geotag? get geotag;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
