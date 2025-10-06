import 'package:shift_space/models/airQuality/wrapper/air_quality_wrapper.dart';
import 'package:shift_space/models/apiResponse/dto/api_response_dto.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/apiResponse/vo/api_response_vo.dart';
import 'package:shift_space/models/healthRisk/wrapper/health_risk_wrapper.dart';
import 'package:shift_space/models/location/wrapper/location_wrapper.dart';
import 'package:shift_space/models/weather/wrapper/weather_wrapper.dart';

import '../../../core/interfaces/wrapper.dart';
import '../../../core/mixins/wrapper_validation_mixin.dart';

class ApiResponseWrapper //
    extends Wrapper<ApiResponseDTO, ApiResponse, ApiResponseVO>
    with WrapperValidationMixin<ApiResponseWrapper, ApiResponse> {

  ApiResponseWrapper([
    this._location,
  ]);

  final ApiResponse? _location;

  @override
  String key = 'location';

  @override
  ApiResponse get model => getValidatedModel(_location);

  @override
  ApiResponse toModel(ApiResponseDTO dto) => ApiResponse(
    date: dto.date,
    id: dto.id,
    location: dto.location == null ? null : LocationWrapper().toModel(dto.location!),
    weather: dto.weather == null ? null : WeatherWrapper().toModel(dto.weather!),
    healthRisk: dto.healthRisk == null ? null : HealthRiskWrapper().toModel(dto.healthRisk!),
    airQuality: dto.airQuality == null ? null : AirQualityWrapper().toModel(dto.airQuality!),
  );

  @override
  ApiResponseVO toVO(ApiResponse location) => ApiResponseVO(
    date: location.date,
    id: location.id,
    location: location.location == null ? null : LocationWrapper().toVO(location.location!),
    weather: location.weather == null ? null : WeatherWrapper().toVO(location.weather!),
    healthRisk: location.healthRisk == null ? null : HealthRiskWrapper().toVO(location.healthRisk!),
    airQuality: location.airQuality == null ? null : AirQualityWrapper().toVO(location.airQuality!),
  );

  @override
  ApiResponseDTO fromJson(Map<String, dynamic> json) {
    return ApiResponseDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonVO(ApiResponseVO vo) {
    return vo.toJson();
  }
}
