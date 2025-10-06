// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_risk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRiskDTO _$HealthRiskDTOFromJson(Map<String, dynamic> json) =>
    HealthRiskDTO(
      id: (json['id'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      label: json['label'] as String?,
      recommendation: json['recommendation'] as String?,
    );

Map<String, dynamic> _$HealthRiskDTOToJson(HealthRiskDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'label': instance.label,
      'recommendation': instance.recommendation,
    };
