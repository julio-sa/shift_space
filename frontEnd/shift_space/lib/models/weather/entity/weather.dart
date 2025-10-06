import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@Freezed(toJson: true)
abstract class Weather with _$Weather {
  const factory Weather({int? id, String? temperature, String? humidity}) =
      _Weather;
}
