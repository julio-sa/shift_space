import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/airQuality/dto/air_quality_dto.dart';
import 'package:shift_space/models/airQuality/entity/air_quality.dart';
import 'package:shift_space/models/airQuality/wrapper/air_quality_wrapper.dart';

class AirQualityMapper extends JsonConverter<AirQuality, Map<String, dynamic>> {
  const AirQualityMapper();

  @override
  AirQuality fromJson(Map<String, dynamic> json) {
    return AirQualityWrapper().toModel(AirQualityDTO.fromJson(json));
  }

  @override
  Map<String, dynamic> toJson(AirQuality object) {
    return AirQualityWrapper().toVO(object).toJson();
  }
}
