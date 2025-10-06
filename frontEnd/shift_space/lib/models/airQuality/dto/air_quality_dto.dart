import 'package:json_annotation/json_annotation.dart';

part 'air_quality_dto.g.dart';

@JsonSerializable()
class AirQualityDTO {
  @JsonKey(name: 'pm25_aqi')
  double? pm25;

  @JsonKey(name: 'o3_aqi')
  double? o3;

  AirQualityDTO({
    this.pm25,
    this.o3,
  });

  factory AirQualityDTO.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AirQualityDTOToJson(this);
}
