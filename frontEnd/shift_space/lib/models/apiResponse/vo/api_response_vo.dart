import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shift_space/models/airQuality/converter/air_quality.dart';
import 'package:shift_space/models/airQuality/vo/air_quality_vo.dart';
import 'package:shift_space/models/healthRisk/converter/health_risk_converter.dart';
import 'package:shift_space/models/healthRisk/vo/health_risk_vo.dart';
import 'package:shift_space/models/location/converter/location_converter.dart';
import 'package:shift_space/models/location/vo/location_vo.dart';
import 'package:shift_space/models/weather/converter/location_converter.dart';
import 'package:shift_space/models/weather/vo/weather_vo.dart';

part 'api_response_vo.freezed.dart';
part 'api_response_vo.g.dart';

@Freezed(toJson: true)
abstract class ApiResponseVO with _$ApiResponseVO {
  const factory ApiResponseVO({
    DateTime? date,
    int? id,

    @LocationConverter() LocationVO? location,
    @WeatherConverter() WeatherVO? weather,
    @HealthRiskConverter() HealthRiskVO? healthRisk,
    @AirQualityConverter() AirQualityVO? airQuality,
  }) = _ApiResponseVO;
}
