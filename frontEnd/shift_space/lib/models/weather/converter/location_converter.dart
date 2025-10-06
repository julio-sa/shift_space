import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/weather/dto/weather_dto.dart';

class WeatherConverter
    implements JsonConverter<WeatherDTO, Map<String, dynamic>> {
  const WeatherConverter();

  @override
  WeatherDTO fromJson(Map<String, dynamic> json) {
    return WeatherDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(WeatherDTO userDTO) {
    return userDTO.toJson();
  }
}
