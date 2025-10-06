import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_risk_vo.freezed.dart';
part 'health_risk_vo.g.dart';

@Freezed(toJson: true)
abstract class HealthRiskVO with _$HealthRiskVO {
  const factory HealthRiskVO({
     int? id,
    String? level,
    String? label,
    String? recommendation,
  }) = _HealthRiskVO;
}
