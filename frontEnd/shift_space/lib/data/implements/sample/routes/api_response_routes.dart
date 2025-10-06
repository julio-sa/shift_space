import 'package:shift_space/core/formatters/format_date_time.dart';
import 'package:shift_space/data/base/base_routes.dart';

class ApiResponseRoutes extends BaseRoutes {
  ApiResponseRoutes() : super(controllerName: 'air-quality');

  String getApiResponse(String zipCode, DateTime date) {
    final url = custom(
      endpoint: zipCode,
      pathVariable: FormatDateTime.formatDate(date),
    );
    return url;
  }
}
