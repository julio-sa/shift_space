

import 'package:shift_space/core/classes/app_exception_class.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/apiResponse/wrapper/api_response_wrapper.dart';
import 'package:shift_space/models/healthRisk/entity/health_risk.dart';
import 'package:shift_space/models/healthRisk/wrapper/health_risk_wrapper.dart';
import 'package:shift_space/models/location/entity/location.dart';
import 'package:shift_space/models/location/wrapper/location_wrapper.dart';
import 'package:shift_space/models/weather/entity/weather.dart';
import 'package:shift_space/models/weather/wrapper/weather_wrapper.dart';

abstract class Wrapper<DTO, M, VO> {
  late final M? _model;
  late final VO? _vo;

  Wrapper();

  String get key;

  M? get model => _model;
  VO? get vo => _vo;

  M toModel(DTO dto);
  VO toVO(M model);

  // Inicializa a partir de DTO
  void fromDTO(DTO dto) {
    final m = toModel(dto);
    _model = m;
    _vo = toVO(m);
  }

  // Inicializa a partir de Model
  void fromModel(M model) {
    _model = model;
    _vo = toVO(model);
  }

  // Conversão de lista de DTOs para lista de Models
  List<M> toModelList(List<DTO> dtoList) {
    return dtoList.map(toModel).toList();
  }

  List<Map<String, dynamic>> toJsonList(List<M> models) {
    return models.map((e) => (e as dynamic).toJson() as Map<String, dynamic>).toList();
  }

  List<DTO> fromJsonListToDTOs(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
  DTO fromJson(Map<String, dynamic> json);
  // Map<String, dynamic> toJsonModel(M model);
  Map<String, dynamic> toJsonVO(VO vo);


  // identifica um object e retorna seu wrapper
  static Wrapper wrap(Object? raw){
    if(raw is Location) return LocationWrapper(raw);
    if(raw is Weather) return WeatherWrapper(raw);
    if(raw is HealthRisk) return HealthRiskWrapper(raw);
    if(raw is ApiResponse) return ApiResponseWrapper(raw);
    if(raw is Wrapper) return raw;
    throw AppException('Object not found');
  }
}
