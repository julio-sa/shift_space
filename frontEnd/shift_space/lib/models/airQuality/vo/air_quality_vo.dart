import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_vo.freezed.dart';
part 'air_quality_vo.g.dart';

@Freezed(toJson: true)
abstract class AirQualityVO with _$AirQualityVO {
  const factory AirQualityVO({
    String? pm25, String? o3,
  }) = _AirQualityVO;
}
