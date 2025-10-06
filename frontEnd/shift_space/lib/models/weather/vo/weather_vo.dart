import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_vo.freezed.dart';
part 'weather_vo.g.dart';

@Freezed(toJson: true)
abstract class WeatherVO with _$WeatherVO {
  const factory WeatherVO({int? id, String? temperature, String? humidity}) =
      _WeatherVO;
}
