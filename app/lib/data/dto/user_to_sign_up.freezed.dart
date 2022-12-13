// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_to_sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToSignUp _$UserToSignUpFromJson(Map<String, dynamic> json) {
  return _UserToSignUp.fromJson(json);
}

/// @nodoc
mixin _$UserToSignUp {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToSignUpCopyWith<UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToSignUpCopyWith<$Res> {
  factory $UserToSignUpCopyWith(
          UserToSignUp value, $Res Function(UserToSignUp) then) =
      _$UserToSignUpCopyWithImpl<$Res, UserToSignUp>;
  @useResult
  $Res call({String username, String password, String name});
}

/// @nodoc
class _$UserToSignUpCopyWithImpl<$Res, $Val extends UserToSignUp>
    implements $UserToSignUpCopyWith<$Res> {
  _$UserToSignUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserToSignUpCopyWith<$Res>
    implements $UserToSignUpCopyWith<$Res> {
  factory _$$_UserToSignUpCopyWith(
          _$_UserToSignUp value, $Res Function(_$_UserToSignUp) then) =
      __$$_UserToSignUpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String name});
}

/// @nodoc
class __$$_UserToSignUpCopyWithImpl<$Res>
    extends _$UserToSignUpCopyWithImpl<$Res, _$_UserToSignUp>
    implements _$$_UserToSignUpCopyWith<$Res> {
  __$$_UserToSignUpCopyWithImpl(
      _$_UserToSignUp _value, $Res Function(_$_UserToSignUp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? name = null,
  }) {
    return _then(_$_UserToSignUp(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToSignUp implements _UserToSignUp {
  _$_UserToSignUp(
      {required this.username, required this.password, required this.name});

  factory _$_UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$$_UserToSignUpFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String name;

  @override
  String toString() {
    return 'UserToSignUp(username: $username, password: $password, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToSignUp &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      __$$_UserToSignUpCopyWithImpl<_$_UserToSignUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToSignUpToJson(
      this,
    );
  }
}

abstract class _UserToSignUp implements UserToSignUp {
  factory _UserToSignUp(
      {required final String username,
      required final String password,
      required final String name}) = _$_UserToSignUp;

  factory _UserToSignUp.fromJson(Map<String, dynamic> json) =
      _$_UserToSignUp.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}
