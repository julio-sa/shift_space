import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/weather/dto/weather_dto.dart';
import 'package:shift_space/models/weather/entity/weather.dart';
import 'package:shift_space/models/weather/wrapper/weather_wrapper.dart';

class WeatherMapper extends JsonConverter<Weather, Map<String, dynamic>> {
  const WeatherMapper();

  @override
  Weather fromJson(Map<String, dynamic> json) {
    return WeatherWrapper().toModel(WeatherDTO.fromJson(json));
  }

  @override
  Map<String, dynamic> toJson(Weather object) {
    return WeatherWrapper().toVO(object).toJson();
  }
}