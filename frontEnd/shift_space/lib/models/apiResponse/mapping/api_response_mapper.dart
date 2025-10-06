import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/apiResponse/dto/api_response_dto.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/apiResponse/wrapper/api_response_wrapper.dart';

class ApiResponseMapper extends JsonConverter<ApiResponse, Map<String, dynamic>> {
  const ApiResponseMapper();

  @override
  ApiResponse fromJson(Map<String, dynamic> json) {
    return ApiResponseWrapper().toModel(ApiResponseDTO.fromJson(json));
  }

  @override
  Map<String, dynamic> toJson(ApiResponse object) {
    return ApiResponseWrapper().toVO(object).toJson();
  }
}