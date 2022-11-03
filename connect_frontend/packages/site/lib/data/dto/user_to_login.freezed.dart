// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_to_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToLogin _$UserToLoginFromJson(Map<String, dynamic> json) {
  return _UserToLogin.fromJson(json);
}

/// @nodoc
mixin _$UserToLogin {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToLoginCopyWith<UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToLoginCopyWith<$Res> {
  factory $UserToLoginCopyWith(
          UserToLogin value, $Res Function(UserToLogin) then) =
      _$UserToLoginCopyWithImpl<$Res>;
  $Res call({String username, String password});
}

/// @nodoc
class _$UserToLoginCopyWithImpl<$Res> implements $UserToLoginCopyWith<$Res> {
  _$UserToLoginCopyWithImpl(this._value, this._then);

  final UserToLogin _value;
  // ignore: unused_field
  final $Res Function(UserToLogin) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToLoginCopyWith<$Res>
    implements $UserToLoginCopyWith<$Res> {
  factory _$$_UserToLoginCopyWith(
          _$_UserToLogin value, $Res Function(_$_UserToLogin) then) =
      __$$_UserToLoginCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
}

/// @nodoc
class __$$_UserToLoginCopyWithImpl<$Res> extends _$UserToLoginCopyWithImpl<$Res>
    implements _$$_UserToLoginCopyWith<$Res> {
  __$$_UserToLoginCopyWithImpl(
      _$_UserToLogin _value, $Res Function(_$_UserToLogin) _then)
      : super(_value, (v) => _then(v as _$_UserToLogin));

  @override
  _$_UserToLogin get _value => super._value as _$_UserToLogin;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserToLogin(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToLogin implements _UserToLogin {
  _$_UserToLogin({required this.username, required this.password});

  factory _$_UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$$_UserToLoginFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'UserToLogin(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToLogin &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      __$$_UserToLoginCopyWithImpl<_$_UserToLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToLoginToJson(
      this,
    );
  }
}

abstract class _UserToLogin implements UserToLogin {
  factory _UserToLogin(
      {required final String username,
      required final String password}) = _$_UserToLogin;

  factory _UserToLogin.fromJson(Map<String, dynamic> json) =
      _$_UserToLogin.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
