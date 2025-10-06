import 'package:shift_space/core/config/app_config.dart';

class BaseRoutes {
  late String controllerName;
  final _url = AppConfig.fullApiUrl;

  BaseRoutes({required this.controllerName});

  // get all
  String getAllPaged() => _baseUrl('getallpaged');
  String getAll() => _baseUrl('getall');

  // get by id
  String getById(int id) =>
      _baseUrlWithParams('getbyid', {'id': id.toString()});

  // post
  String post() => _baseUrl('post');

  // put
  String put() => _baseUrl('put');

  // exists
  String exists(int id) => _baseUrlWithParams('exists', {'id': id.toString()});

  // delete
  String delete(int id) => _baseUrlWithParams('delete', {'id': id.toString()});

  // Método para adicionar parâmetros dinamicamente na URL
  String _baseUrlWithParams(String path, Map<String, String> params) {
    final uri = Uri.parse('$_url/$controllerName/$path')
        .replace(queryParameters: params);
    return uri.toString();
  }

  String _baseWithPathVariable(String endpoint, String pathVariable) {
    final uri = Uri.parse('$_url/$controllerName/$endpoint?date=$pathVariable');
    return uri.toString();
  }

  // Método para retornar URLs customizadas
  String custom({required String endpoint, Map<String, String>? params, String? pathVariable}) {
    return pathVariable != null ? _baseWithPathVariable(endpoint, pathVariable) : params != null 
        ? _baseUrlWithParams(endpoint, params)
        : _baseUrl(endpoint);
  }

  // Método privado para retornar a URL base
  String _baseUrl(String restPath) {
    final url = '$_url/$controllerName/$restPath';
    return url;
  }


}