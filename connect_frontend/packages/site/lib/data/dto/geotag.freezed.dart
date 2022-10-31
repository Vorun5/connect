// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geotag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Geotag _$GeotagFromJson(Map<String, dynamic> json) {
  return _Geotag.fromJson(json);
}

/// @nodoc
mixin _$Geotag {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeotagCopyWith<Geotag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeotagCopyWith<$Res> {
  factory $GeotagCopyWith(Geotag value, $Res Function(Geotag) then) =
      _$GeotagCopyWithImpl<$Res>;
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$GeotagCopyWithImpl<$Res> implements $GeotagCopyWith<$Res> {
  _$GeotagCopyWithImpl(this._value, this._then);

  final Geotag _value;
  // ignore: unused_field
  final $Res Function(Geotag) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_GeotagCopyWith<$Res> implements $GeotagCopyWith<$Res> {
  factory _$$_GeotagCopyWith(_$_Geotag value, $Res Function(_$_Geotag) then) =
      __$$_GeotagCopyWithImpl<$Res>;
  @override
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$$_GeotagCopyWithImpl<$Res> extends _$GeotagCopyWithImpl<$Res>
    implements _$$_GeotagCopyWith<$Res> {
  __$$_GeotagCopyWithImpl(_$_Geotag _value, $Res Function(_$_Geotag) _then)
      : super(_value, (v) => _then(v as _$_Geotag));

  @override
  _$_Geotag get _value => super._value as _$_Geotag;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Geotag(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geotag implements _Geotag {
  _$_Geotag({required this.latitude, required this.longitude});

  factory _$_Geotag.fromJson(Map<String, dynamic> json) =>
      _$$_GeotagFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'Geotag(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geotag &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_GeotagCopyWith<_$_Geotag> get copyWith =>
      __$$_GeotagCopyWithImpl<_$_Geotag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeotagToJson(
      this,
    );
  }
}

abstract class _Geotag implements Geotag {
  factory _Geotag(
      {required final double? latitude,
      required final double? longitude}) = _$_Geotag;

  factory _Geotag.fromJson(Map<String, dynamic> json) = _$_Geotag.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_GeotagCopyWith<_$_Geotag> get copyWith =>
      throw _privateConstructorUsedError;
}
