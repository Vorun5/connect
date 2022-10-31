import 'package:freezed_annotation/freezed_annotation.dart';

part 'geotag.freezed.dart';
part 'geotag.g.dart';

@freezed
class Geotag with _$Geotag {
  factory Geotag({
    required double? latitude,
    required double? longitude,
  }) = _Geotag;

  factory Geotag.fromJson(Map<String, dynamic> json) => _$GeotagFromJson(json);
}
