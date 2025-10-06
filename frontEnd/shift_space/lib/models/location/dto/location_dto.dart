import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDTO {
  int? id;
  double? lat;
  double? lon;

  @JsonKey(name: 'zip_code')
  String? zipCode;

  LocationDTO({
    this.id,
    this.lat,
    this.lon,
    this.zipCode,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) {
    return _$LocationDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}
