// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponse {

 DateTime? get date; int? get id; Location? get location; Weather? get weather; HealthRisk? get healthRisk; AirQuality? get airQuality;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<ApiResponse> get copyWith => _$ApiResponseCopyWithImpl<ApiResponse>(this as ApiResponse, _$identity);

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.healthRisk, healthRisk) || other.healthRisk == healthRisk)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,location,weather,healthRisk,airQuality);

@override
String toString() {
  return 'ApiResponse(date: $date, id: $id, location: $location, weather: $weather, healthRisk: $healthRisk, airQuality: $airQuality)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<$Res>  {
  factory $ApiResponseCopyWith(ApiResponse value, $Res Function(ApiResponse) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 DateTime? date, int? id, Location? location, Weather? weather, HealthRisk? healthRisk, AirQuality? airQuality
});


$LocationCopyWith<$Res>? get location;$WeatherCopyWith<$Res>? get weather;$HealthRiskCopyWith<$Res>? get healthRisk;$AirQualityCopyWith<$Res>? get airQuality;

}
/// @nodoc
class _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._self, this._then);

  final ApiResponse _self;
  final $Res Function(ApiResponse) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? id = freezed,Object? location = freezed,Object? weather = freezed,Object? healthRisk = freezed,Object? airQuality = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather?,healthRisk: freezed == healthRisk ? _self.healthRisk : healthRisk // ignore: cast_nullable_to_non_nullable
as HealthRisk?,airQuality: freezed == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality?,
  ));
}
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRiskCopyWith<$Res>? get healthRisk {
    if (_self.healthRisk == null) {
    return null;
  }

  return $HealthRiskCopyWith<$Res>(_self.healthRisk!, (value) {
    return _then(_self.copyWith(healthRisk: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res>? get airQuality {
    if (_self.airQuality == null) {
    return null;
  }

  return $AirQualityCopyWith<$Res>(_self.airQuality!, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns on ApiResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  int? id,  Location? location,  Weather? weather,  HealthRisk? healthRisk,  AirQuality? airQuality)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.date,_that.id,_that.location,_that.weather,_that.healthRisk,_that.airQuality);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  int? id,  Location? location,  Weather? weather,  HealthRisk? healthRisk,  AirQuality? airQuality)  $default,) {final _that = this;
switch (_that) {
case _ApiResponse():
return $default(_that.date,_that.id,_that.location,_that.weather,_that.healthRisk,_that.airQuality);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  int? id,  Location? location,  Weather? weather,  HealthRisk? healthRisk,  AirQuality? airQuality)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.date,_that.id,_that.location,_that.weather,_that.healthRisk,_that.airQuality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ApiResponse implements ApiResponse {
  const _ApiResponse({this.date, this.id, this.location, this.weather, this.healthRisk, this.airQuality});
  

@override final  DateTime? date;
@override final  int? id;
@override final  Location? location;
@override final  Weather? weather;
@override final  HealthRisk? healthRisk;
@override final  AirQuality? airQuality;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseCopyWith<_ApiResponse> get copyWith => __$ApiResponseCopyWithImpl<_ApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponse&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.healthRisk, healthRisk) || other.healthRisk == healthRisk)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,location,weather,healthRisk,airQuality);

@override
String toString() {
  return 'ApiResponse(date: $date, id: $id, location: $location, weather: $weather, healthRisk: $healthRisk, airQuality: $airQuality)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseCopyWith<$Res> implements $ApiResponseCopyWith<$Res> {
  factory _$ApiResponseCopyWith(_ApiResponse value, $Res Function(_ApiResponse) _then) = __$ApiResponseCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, int? id, Location? location, Weather? weather, HealthRisk? healthRisk, AirQuality? airQuality
});


@override $LocationCopyWith<$Res>? get location;@override $WeatherCopyWith<$Res>? get weather;@override $HealthRiskCopyWith<$Res>? get healthRisk;@override $AirQualityCopyWith<$Res>? get airQuality;

}
/// @nodoc
class __$ApiResponseCopyWithImpl<$Res>
    implements _$ApiResponseCopyWith<$Res> {
  __$ApiResponseCopyWithImpl(this._self, this._then);

  final _ApiResponse _self;
  final $Res Function(_ApiResponse) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? id = freezed,Object? location = freezed,Object? weather = freezed,Object? healthRisk = freezed,Object? airQuality = freezed,}) {
  return _then(_ApiResponse(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather?,healthRisk: freezed == healthRisk ? _self.healthRisk : healthRisk // ignore: cast_nullable_to_non_nullable
as HealthRisk?,airQuality: freezed == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality?,
  ));
}

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRiskCopyWith<$Res>? get healthRisk {
    if (_self.healthRisk == null) {
    return null;
  }

  return $HealthRiskCopyWith<$Res>(_self.healthRisk!, (value) {
    return _then(_self.copyWith(healthRisk: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res>? get airQuality {
    if (_self.airQuality == null) {
    return null;
  }

  return $AirQualityCopyWith<$Res>(_self.airQuality!, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}

// dart format on
