// dash_board_view_model.dart
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shift_space/data/implements/sample/repository/api_response_repository.dart';
import 'package:shift_space/models/airQuality/entity/air_quality.dart';
import 'package:shift_space/models/apiResponse/entity/api_response.dart';
import 'package:shift_space/models/healthRisk/entity/health_risk.dart';
import 'package:shift_space/models/location/entity/location.dart';
import 'package:shift_space/models/weather/entity/weather.dart';

part 'dash_board_view_model.g.dart';

@riverpod
class DashBoardViewModel extends _$DashBoardViewModel {
  @override
  Future<ApiResponse?> build(String? zipCode, DateTime? date) async {
    final repo = ref.read(apiResponseRepoProvider);

    if (zipCode == null) return null;
    final response = await _apiResponse(zipCode, repo, date ?? DateTime.now());
    return response;
  }

  // ✅ Classificação de risco para PM2.5 e O3
  RiskLevel _getAirQualityRisk(double value) {
    if (value <= 50) return RiskLevel.good;
    if (value <= 100) return RiskLevel.moderate;
    if (value <= 150) return RiskLevel.unhealthyForSensitive;
    if (value <= 200) return RiskLevel.unhealthy;
    if (value <= 300) return RiskLevel.veryUnhealthy;
    return RiskLevel.hazardous;
  }

  // ✅ Classificação de risco para umidade
  RiskLevel _getHumidityRisk(double humidity) {
    if (humidity >= 40 && humidity <= 60) return RiskLevel.good;
    if (humidity > 60 && humidity <= 70) return RiskLevel.moderate;
    if (humidity > 70 || humidity < 30) return RiskLevel.unhealthy;
    return RiskLevel.veryUnhealthy;
  }

  // ✅ Avaliação geral de risco
  // ✅ ADICIONE no dash_board_view_model.dart
OverallRisk assessOverallRisk(ApiResponse response) {
  // ✅ Proteção dupla contra nulls
  final pm25String = response.airQuality?.pm25?.toString() ?? '0';
  final o3String = response.airQuality?.o3?.toString() ?? '0';
  final humidityString = response.weather?.humidity?.toString() ?? '0';

  Logger().i('DEBUG - PM2.5: $pm25String, O3: $o3String, Humidity: $humidityString');

  // ✅ Proteção nas conversões
  final pm25Double = double.tryParse(pm25String.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
  final o3Double = double.tryParse(o3String.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
  final humidityDouble = double.tryParse(humidityString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

  final pm25Risk = _getAirQualityRisk(pm25Double);
  final o3Risk = _getAirQualityRisk(o3Double);
  final humidityRisk = _getHumidityRisk(humidityDouble);

  final risks = [pm25Risk, o3Risk, humidityRisk];
  final maxRisk = risks.reduce((a, b) => a.index > b.index ? a : b);

  return OverallRisk(
    level: maxRisk,
    pm25Value: pm25String.isEmpty ? 'N/A' : pm25String,
    o3Value: o3String.isEmpty ? 'N/A' : o3String,
    humidityValue: humidityString.isEmpty ? 'N/A' : humidityString,
    pm25Risk: pm25Risk,
    o3Risk: o3Risk,
    humidityRisk: humidityRisk,
  );
}

  Future<ApiResponse?> _apiResponse(
    String zipCode,
    ApiResponseRepository repo,
    DateTime date,
  ) async {
    if (zipCode != '12345-678') {
      final apiResponse = await repo.apiResponse(zipCode, date);
      if (apiResponse == null) return null;
      return apiResponse;
    }

    // Mock data com valores para teste
    final response = ApiResponse(
      location: Location(zipCode: '12345-678', id: 1, lat: '-23.5505', lon: '-46.6333'),
      date: date,
      weather: Weather(humidity: '70.8', id: 1, temperature: '24'),
      airQuality: AirQuality(o3: '9.0', pm25: '79.0'),
      healthRisk: HealthRisk(
        label: 'Moderado',
        level: 'moderate',
        recommendation: 'Pessoas sensíveis devem considerar limitar atividades ao ar livre',
        id: 1,
      ),
    );
    return response;
  }
}

// ✅ Enums para classificação
enum RiskLevel {
  good,
  moderate,
  unhealthyForSensitive,
  unhealthy,
  veryUnhealthy,
  hazardous
}

// ✅ Classe para avaliação geral
class OverallRisk {
  final RiskLevel level;
  final String pm25Value;    // ✅ String ao invés de double
  final String o3Value;      // ✅ String ao invés de double
  final String humidityValue; // ✅ String ao invés de double
  final RiskLevel pm25Risk;
  final RiskLevel o3Risk;
  final RiskLevel humidityRisk;

  OverallRisk({
    required this.level,
    required this.pm25Value,
    required this.o3Value,
    required this.humidityValue,
    required this.pm25Risk,
    required this.o3Risk,
    required this.humidityRisk,
  });
}
