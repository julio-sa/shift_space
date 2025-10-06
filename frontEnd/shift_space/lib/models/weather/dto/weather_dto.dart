
import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDTO {
  int? id;

  @JsonKey(name: 'temperature_c')
  double? temperature;

  @JsonKey(name: 'humidity_percent')
  double? humidity;

  WeatherDTO({
    this.id,
    this.temperature,
    this.humidity,
  });

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}
