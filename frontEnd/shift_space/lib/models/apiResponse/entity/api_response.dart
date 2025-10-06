import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shift_space/models/airQuality/entity/air_quality.dart';
import 'package:shift_space/models/healthRisk/entity/health_risk.dart';
import 'package:shift_space/models/location/entity/location.dart';
import 'package:shift_space/models/weather/entity/weather.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(toJson: true)
abstract class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    DateTime? date,
    int? id,
    Location? location,
    Weather? weather,
    HealthRisk? healthRisk,
    AirQuality? airQuality,
  }) = _ApiResponse;
}
