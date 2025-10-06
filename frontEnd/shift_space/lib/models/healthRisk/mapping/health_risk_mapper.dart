import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/healthRisk/dto/health_risk_dto.dart';
import 'package:shift_space/models/healthRisk/entity/health_risk.dart';
import 'package:shift_space/models/healthRisk/wrapper/health_risk_wrapper.dart';

class HealthRiskMapper extends JsonConverter<HealthRisk, Map<String, dynamic>> {
  const HealthRiskMapper();

  @override
  HealthRisk fromJson(Map<String, dynamic> json) {
    return HealthRiskWrapper().toModel(HealthRiskDTO.fromJson(json));
  }

  @override
  Map<String, dynamic> toJson(HealthRisk object) {
    return HealthRiskWrapper().toVO(object).toJson();
  }
}