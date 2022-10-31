// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_to_sing_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToSingUp _$UserToSingUpFromJson(Map<String, dynamic> json) {
  return _UserToSingUp.fromJson(json);
}

/// @nodoc
mixin _$UserToSingUp {
  String get username => throw _privateConstructorUsedError;
  String get userDisplayName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToSingUpCopyWith<UserToSingUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToSingUpCopyWith<$Res> {
  factory $UserToSingUpCopyWith(
          UserToSingUp value, $Res Function(UserToSingUp) then) =
      _$UserToSingUpCopyWithImpl<$Res>;
  $Res call(
      {String username, String userDisplayName, String password, String name});
}

/// @nodoc
class _$UserToSingUpCopyWithImpl<$Res> implements $UserToSingUpCopyWith<$Res> {
  _$UserToSingUpCopyWithImpl(this._value, this._then);

  final UserToSingUp _value;
  // ignore: unused_field
  final $Res Function(UserToSingUp) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? userDisplayName = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToSingUpCopyWith<$Res>
    implements $UserToSingUpCopyWith<$Res> {
  factory _$$_UserToSingUpCopyWith(
          _$_UserToSingUp value, $Res Function(_$_UserToSingUp) then) =
      __$$_UserToSingUpCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username, String userDisplayName, String password, String name});
}

/// @nodoc
class __$$_UserToSingUpCopyWithImpl<$Res>
    extends _$UserToSingUpCopyWithImpl<$Res>
    implements _$$_UserToSingUpCopyWith<$Res> {
  __$$_UserToSingUpCopyWithImpl(
      _$_UserToSingUp _value, $Res Function(_$_UserToSingUp) _then)
      : super(_value, (v) => _then(v as _$_UserToSingUp));

  @override
  _$_UserToSingUp get _value => super._value as _$_UserToSingUp;

  @override
  $Res call({
    Object? username = freezed,
    Object? userDisplayName = freezed,
    Object? password = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_UserToSingUp(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToSingUp implements _UserToSingUp {
  _$_UserToSingUp(
      {required this.username,
      required this.userDisplayName,
      required this.password,
      required this.name});

  factory _$_UserToSingUp.fromJson(Map<String, dynamic> json) =>
      _$$_UserToSingUpFromJson(json);

  @override
  final String username;
  @override
  final String userDisplayName;
  @override
  final String password;
  @override
  final String name;

  @override
  String toString() {
    return 'UserToSingUp(username: $username, userDisplayName: $userDisplayName, password: $password, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToSingUp &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.userDisplayName, userDisplayName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(userDisplayName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_UserToSingUpCopyWith<_$_UserToSingUp> get copyWith =>
      __$$_UserToSingUpCopyWithImpl<_$_UserToSingUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToSingUpToJson(
      this,
    );
  }
}

abstract class _UserToSingUp implements UserToSingUp {
  factory _UserToSingUp(
      {required final String username,
      required final String userDisplayName,
      required final String password,
      required final String name}) = _$_UserToSingUp;

  factory _UserToSingUp.fromJson(Map<String, dynamic> json) =
      _$_UserToSingUp.fromJson;

  @override
  String get username;
  @override
  String get userDisplayName;
  @override
  String get password;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserToSingUpCopyWith<_$_UserToSingUp> get copyWith =>
      throw _privateConstructorUsedError;
}
