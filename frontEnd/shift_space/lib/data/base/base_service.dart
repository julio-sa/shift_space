import 'package:dio/dio.dart';
import 'package:shift_space/core/classes/app_exception_class.dart';
import 'package:shift_space/core/classes/result_class.dart';
import 'package:shift_space/core/interfaces/wrapper.dart';
import 'package:shift_space/data/base/base_routes.dart';

abstract class BaseService<DTO, M, VO> {
  BaseService({required this.apiRoute, required this.wrapper});

  final Wrapper<DTO, M, VO> wrapper;
  final BaseRoutes apiRoute;

  final Dio dio = Dio();

  //Métodos https genéricos
  //Get all
  Future<Result<List<DTO>>> getAll() async {
    return handleResult(() async {
      final header = await getAuthHeaders();

      final response = await dio.get(
        apiRoute.getAll(),
        options: Options(headers: header),
      );

      _handleStatusCode(response, 'getAll');

      final data = List<Map<String, dynamic>>.from(response.data);
      final list = wrapper.fromJsonListToDTOs(data);
      return list;
    });
  }

  //Get by id
  Future<Result<DTO>> getById(int id) async {
    return handleResult(() async {
      final header = await getAuthHeaders();

      final response = await dio.get(
        apiRoute.getById(id),
        options: Options(headers: header),
      );

      _handleStatusCode(response, 'getById');

      final data = Map<String, dynamic>.from(response.data);
      return wrapper.fromJson(data);
    });
  }

  //Post
  Future<Result<DTO>> post(VO vo) async {
    return handleResult(() async {
      final header = await getAuthHeaders();

      final response = await dio.post(
        apiRoute.post(),
        options: Options(headers: header),
        data: wrapper.toJsonVO(vo),
      );

      _handleStatusCode(response, 'post');

      final data = response.data as Map<String, dynamic>;
      return wrapper.fromJson(data);
    });
  }

  //put
  Future<Result<DTO>> put(VO vo) async {
    return handleResult(() async {
      final header = await getAuthHeaders();

      final response = await dio.put(
        apiRoute.put(),
        options: Options(headers: header),
        data: wrapper.toJsonVO(vo),
      );

      _handleStatusCode(response, 'put');

      final data = response.data as Map<String, dynamic>;
      return wrapper.fromJson(data);
    });
  }

  //delete
  Future<Result<void>> delete(int id) async {
    return handleResult(() async {
      final header = await getAuthHeaders();

      final response = await dio.delete(
        apiRoute.delete(id),
        options: Options(headers: header),
      );

      _handleStatusCode(response, 'delete');

      if (response.statusCode == 204) return;
      throw AppException(
        "Failed to delete object, status: ${response.statusCode}",
        statusCode: response.statusCode,
      );
    });
  }

  Future<Map<String, String>> getAuthHeaders({
    Map<String, String>? headers,
  }) async {
    // final result = await FirebaseEmailRepository().getUserToken();

    // final token = switch (result) {
    //   Ok(value: final token) => token,
    //   Error(error: final e) => throw e,
    // };

    final header = {
      // 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      ...?headers
    };

    return header;
  }

  void _handleStatusCode(Response response, String s) {
    if (response.statusCode! < 200 && response.statusCode! > 299) {
      throw AppException(
        "Failed to $s, status: ${response.statusCode}",
        statusCode: response.statusCode,
      );
    }
  }
}
