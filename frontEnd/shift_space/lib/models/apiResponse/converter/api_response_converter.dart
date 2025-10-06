import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/apiResponse/dto/api_response_dto.dart';

class ApiResponseConverter
    implements JsonConverter<ApiResponseDTO, Map<String, dynamic>> {
  const ApiResponseConverter();

  @override
  ApiResponseDTO fromJson(Map<String, dynamic> json) {
    return ApiResponseDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ApiResponseDTO userDTO) {
    return userDTO.toJson();
  }
}
