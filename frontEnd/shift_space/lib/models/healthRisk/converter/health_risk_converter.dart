import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/healthRisk/dto/health_risk_dto.dart';

class HealthRiskConverter
    implements JsonConverter<HealthRiskDTO, Map<String, dynamic>> {
  const HealthRiskConverter();

  @override
  HealthRiskDTO fromJson(Map<String, dynamic> json) {
    return HealthRiskDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(HealthRiskDTO userDTO) {
    return userDTO.toJson();
  }
}
