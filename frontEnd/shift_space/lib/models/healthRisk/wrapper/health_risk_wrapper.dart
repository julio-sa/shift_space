import 'package:shift_space/models/healthRisk/dto/health_risk_dto.dart';
import 'package:shift_space/models/healthRisk/entity/health_risk.dart';
import 'package:shift_space/models/healthRisk/vo/health_risk_vo.dart';

import '../../../core/interfaces/wrapper.dart';
import '../../../core/mixins/wrapper_validation_mixin.dart';

class HealthRiskWrapper //
    extends Wrapper<HealthRiskDTO, HealthRisk, HealthRiskVO>
    with WrapperValidationMixin<HealthRiskWrapper, HealthRisk> {

  HealthRiskWrapper([
    this._location,
  ]);

  final HealthRisk? _location;

  @override
  String key = 'location';

  @override
  HealthRisk get model => getValidatedModel(_location);

  @override
  HealthRisk toModel(HealthRiskDTO dto) => HealthRisk(
    id: dto.id,
    label: dto.label,
    level: dto.level.toString(),
    recommendation: dto.recommendation,
  );

  @override
  HealthRiskVO toVO(HealthRisk model) => HealthRiskVO(
    id: model.id,
    label: model.label,
    level: model.level,
    recommendation: model.recommendation,
  );

  @override
  HealthRiskDTO fromJson(Map<String, dynamic> json) {
    return HealthRiskDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonVO(HealthRiskVO vo) {
    return vo.toJson();
  }
}
