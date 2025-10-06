import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/location/dto/location_dto.dart';

class LocationConverter
    implements JsonConverter<LocationDTO, Map<String, dynamic>> {
  const LocationConverter();

  @override
  LocationDTO fromJson(Map<String, dynamic> json) {
    return LocationDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LocationDTO userDTO) {
    return userDTO.toJson();
  }
}
