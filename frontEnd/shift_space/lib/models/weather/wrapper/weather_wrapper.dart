import 'package:shift_space/models/weather/vo/weather_vo.dart';

import '../../../core/interfaces/wrapper.dart';
import '../../../core/mixins/wrapper_validation_mixin.dart';
import '../dto/weather_dto.dart';
import '../entity/weather.dart';

class WeatherWrapper //
    extends Wrapper<WeatherDTO, Weather, WeatherVO>
    with WrapperValidationMixin<WeatherWrapper, Weather> {
  WeatherWrapper([this._wheater]);

  final Weather? _wheater;

  @override
  String key = 'wheater';

  @override
  Weather get model => getValidatedModel(_wheater);

  @override
  Weather toModel(WeatherDTO dto) => Weather(
    humidity: dto.humidity.toString(),
    id: dto.id,
    temperature: dto.humidity.toString(),
  );

  @override
  WeatherVO toVO(Weather wheater) => WeatherVO(
    humidity: wheater.humidity,
    id: wheater.id,
    temperature: wheater.temperature,
  );

  @override
  WeatherDTO fromJson(Map<String, dynamic> json) {
    return WeatherDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonVO(WeatherVO vo) {
    return vo.toJson();
  }
}
