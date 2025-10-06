import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_vo.freezed.dart';
part 'location_vo.g.dart';

@Freezed(toJson: true)
abstract class LocationVO with _$LocationVO {
  const factory LocationVO({
    int? id,
    String? zipCode,
    String? lat,
    String? lon,
  }) = _LocationVO;
}
