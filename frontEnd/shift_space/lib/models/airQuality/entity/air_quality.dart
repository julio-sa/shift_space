import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality.freezed.dart';
part 'air_quality.g.dart';

@Freezed(toJson: true)
abstract class AirQuality with _$AirQuality {
  const factory AirQuality({
    String? pm25, String? o3}) = _AirQuality;
}
