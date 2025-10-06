import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shift_space/core/classes/result_class.dart';
import 'package:shift_space/data/base/base_repository.dart';
import 'package:shift_space/data/implements/sample/service/api_response_service.dart';
import 'package:shift_space/models/apiResponse/dto/api_response_dto.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/apiResponse/vo/api_response_vo.dart';
import 'package:shift_space/models/apiResponse/wrapper/api_response_wrapper.dart';

part 'api_response_repository.g.dart';

@riverpod
ApiResponseRepository apiResponseRepo(Ref ref) {
  return ApiResponseRepository();
}

// classe com métodos utilitários, sem estado
class ApiResponseRepository
    extends BaseRepository<ApiResponseDTO, ApiResponse, ApiResponseVO> {
  ApiResponseRepository()
    : super(
        service: ApiResponseService(),
        wrapper: ApiResponseWrapper(),
      );

  final _service = ApiResponseService();

  Future<ApiResponse?> apiResponse(String zipCode, DateTime date) async {

    final formattedZipCode = _formatZipCode(zipCode);

    final result = await _service.getApiResponse(formattedZipCode, date);

    final response = result.getOrThrow(
      file: 'apiResponseRepo',
      method: 'apiResponse',
    );

    if(response == null) return null;

    final model = wrapper.toModel(response);

    return model;
  }
  
  String _formatZipCode(String zipCode) {
    // Remove tudo que não é número
    String numbersOnly = zipCode.replaceAll(RegExp(r'[^0-9]'), '');
    
    // Se tem 8 dígitos, adiciona o hífen
    if (numbersOnly.length == 8) {
      return '${numbersOnly.substring(0, 5)}-${numbersOnly.substring(5)}';
    }
    
    // Se já está no formato correto ou inválido, retorna como está
    return zipCode;
  }
}
