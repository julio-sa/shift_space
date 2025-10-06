import '../../../core/interfaces/wrapper.dart';
import '../../../core/mixins/wrapper_validation_mixin.dart';
import '../dto/location_dto.dart';
import '../entity/location.dart';
import '../vo/location_vo.dart';

class LocationWrapper //
    extends Wrapper<LocationDTO, Location, LocationVO>
    with WrapperValidationMixin<LocationWrapper, Location> {

  LocationWrapper([
    this._location,
  ]);

  final Location? _location;

  @override
  String key = 'location';

  @override
  Location get model => getValidatedModel(_location);

  @override
  Location toModel(LocationDTO dto) => Location(
    id: dto.id,
    lat: dto.lat.toString(),
    lon: dto.lon.toString(),
    zipCode: dto.zipCode,
  );

  @override
  LocationVO toVO(Location location) => LocationVO(
    id: location.id,
    lat: location.lat,
    lon: location.lon,
    zipCode: location.zipCode,
  );

  @override
  LocationDTO fromJson(Map<String, dynamic> json) {
    return LocationDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJsonVO(LocationVO vo) {
    return vo.toJson();
  }
}
