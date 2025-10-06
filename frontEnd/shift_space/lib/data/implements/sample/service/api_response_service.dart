import 'package:dio/dio.dart';
import 'package:shift_space/core/classes/result_class.dart';
import 'package:shift_space/data/base/base_service.dart';
import 'package:shift_space/data/implements/sample/routes/api_response_routes.dart';
import 'package:shift_space/models/apiResponse/dto/api_response_dto.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/apiResponse/vo/api_response_vo.dart';
import 'package:shift_space/models/apiResponse/wrapper/api_response_wrapper.dart';

class ApiResponseService
    extends BaseService<ApiResponseDTO, ApiResponse, ApiResponseVO> {
  ApiResponseService()
    : super(
        apiRoute: ApiResponseRoutes(),
        wrapper: ApiResponseWrapper(),
      );

  Future<Result<ApiResponseDTO?>> getApiResponse(
    String zipCode,
    DateTime date,
  ) async {
    return handleResult(() async {
      final routes = ApiResponseRoutes();

      final header = await getAuthHeaders();
      final url = routes.getApiResponse(zipCode, date);

      final response = await dio.get(
        url,
        options: Options(
          headers: header,
          validateStatus: (status) => status! < 500,
        ),
      );

      final statusCode = response.statusCode;

      if (statusCode != 200) return null;

      final data = Map<String, dynamic>.from(response.data);

      final wrap = wrapper.fromJson(data);

      return wrap;
    });
  }
}
