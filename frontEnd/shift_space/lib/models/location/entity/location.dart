import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@Freezed(toJson: true)
abstract class Location with _$Location {
  const factory Location({
    int? id,
    String? zipCode,
    String? lat,
    String? lon,
  }) = _Location;
}
