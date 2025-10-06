
import 'package:json_annotation/json_annotation.dart';

part 'health_risk_dto.g.dart';

@JsonSerializable()
class HealthRiskDTO {
  int? id;
  int? level;
  String? label;
  String? recommendation;

  HealthRiskDTO({
    this.id,
    this.level,
    this.label,
    this.recommendation,
  });

  factory HealthRiskDTO.fromJson(Map<String, dynamic> json) =>
      _$HealthRiskDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HealthRiskDTOToJson(this);
}
