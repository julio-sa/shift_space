import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/location/dto/location_dto.dart';
import 'package:shift_space/models/location/entity/location.dart';
import 'package:shift_space/models/location/wrapper/location_wrapper.dart';

class LocationMapper extends JsonConverter<Location, Map<String, dynamic>> {
  const LocationMapper();

  @override
  Location fromJson(Map<String, dynamic> json) {
    return LocationWrapper().toModel(LocationDTO.fromJson(json));
  }

  @override
  Map<String, dynamic> toJson(Location object) {
    return LocationWrapper().toVO(object).toJson();
  }
}