import '../../../core/interfaces/wrapper.dart';
import '../../../core/mixins/wrapper_validation_mixin.dart';
import '../dto/air_quality_dto.dart';
import '../entity/air_quality.dart';
import '../vo/air_quality_vo.dart';

class AirQualityWrapper //
    extends Wrapper<AirQualityDTO, AirQuality, AirQualityVO>
    with WrapperValidationMixin<AirQualityWrapper, AirQuality> {

  AirQualityWrapper([
    this._airQuality,
  ]);

  final AirQuality? _airQuality;

  @override
  String key = 'airQuality';

  @override
  AirQuality get model => getValidatedModel(_airQuality);

  @override
  AirQuality toModel(AirQualityDTO dto) => AirQuality(
    o3: dto.o3.toString(),
    pm25: dto.pm25.toString(),
  );

  @override
  AirQualityVO toVO(AirQuality airQuality) => AirQualityVO(
    o3: airQuality.o3,
    pm25: airQuality.pm25,
  );

  @override
  AirQualityDTO fromJson(Map<String, dynamic> json) {
    return AirQualityDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonVO(AirQualityVO vo) {
    return vo.toJson();
  }
}
