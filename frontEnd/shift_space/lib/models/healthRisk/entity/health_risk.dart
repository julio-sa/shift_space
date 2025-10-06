import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_risk.freezed.dart';
part 'health_risk.g.dart';

@Freezed(toJson: true)
abstract class HealthRisk with _$HealthRisk {
  const factory HealthRisk({
    int? id,
    String? level,
    String? label,
    String? recommendation,
  }) = _HealthRisk;
}
