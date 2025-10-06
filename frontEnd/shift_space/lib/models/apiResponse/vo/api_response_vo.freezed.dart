// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponseVO {

 DateTime? get date; int? get id;@LocationConverter() LocationVO? get location;@WeatherConverter() WeatherVO? get weather;@HealthRiskConverter() HealthRiskVO? get healthRisk;@AirQualityConverter() AirQualityVO? get airQuality;
/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseVOCopyWith<ApiResponseVO> get copyWith => _$ApiResponseVOCopyWithImpl<ApiResponseVO>(this as ApiResponseVO, _$identity);

  /// Serializes this ApiResponseVO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseVO&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.healthRisk, healthRisk) || other.healthRisk == healthRisk)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,location,weather,healthRisk,airQuality);

@override
String toString() {
  return 'ApiResponseVO(date: $date, id: $id, location: $location, weather: $weather, healthRisk: $healthRisk, airQuality: $airQuality)';
}


}

/// @nodoc
abstract mixin class $ApiResponseVOCopyWith<$Res>  {
  factory $ApiResponseVOCopyWith(ApiResponseVO value, $Res Function(ApiResponseVO) _then) = _$ApiResponseVOCopyWithImpl;
@useResult
$Res call({
 DateTime? date, int? id,@LocationConverter() LocationVO? location,@WeatherConverter() WeatherVO? weather,@HealthRiskConverter() HealthRiskVO? healthRisk,@AirQualityConverter() AirQualityVO? airQuality
});


$LocationVOCopyWith<$Res>? get location;$WeatherVOCopyWith<$Res>? get weather;$HealthRiskVOCopyWith<$Res>? get healthRisk;$AirQualityVOCopyWith<$Res>? get airQuality;

}
/// @nodoc
class _$ApiResponseVOCopyWithImpl<$Res>
    implements $ApiResponseVOCopyWith<$Res> {
  _$ApiResponseVOCopyWithImpl(this._self, this._then);

  final ApiResponseVO _self;
  final $Res Function(ApiResponseVO) _then;

/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? id = freezed,Object? location = freezed,Object? weather = freezed,Object? healthRisk = freezed,Object? airQuality = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationVO?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherVO?,healthRisk: freezed == healthRisk ? _self.healthRisk : healthRisk // ignore: cast_nullable_to_non_nullable
as HealthRiskVO?,airQuality: freezed == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQualityVO?,
  ));
}
/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationVOCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationVOCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherVOCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherVOCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRiskVOCopyWith<$Res>? get healthRisk {
    if (_self.healthRisk == null) {
    return null;
  }

  return $HealthRiskVOCopyWith<$Res>(_self.healthRisk!, (value) {
    return _then(_self.copyWith(healthRisk: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityVOCopyWith<$Res>? get airQuality {
    if (_self.airQuality == null) {
    return null;
  }

  return $AirQualityVOCopyWith<$Res>(_self.airQuality!, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponseVO].
extension ApiResponseVOPatterns on ApiResponseVO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseVO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseVO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseVO value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseVO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseVO value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseVO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  int? id, @LocationConverter()  LocationVO? location, @WeatherConverter()  WeatherVO? weather, @HealthRiskConverter()  HealthRiskVO? healthRisk, @AirQualityConverter()  AirQualityVO? airQuality)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseVO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  int? id, @LocationConverter()  LocationVO? location, @WeatherConverter()  WeatherVO? weather, @HealthRiskConverter()  HealthRiskVO? healthRisk, @AirQualityConverter()  AirQualityVO? airQuality)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseVO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  int? id, @LocationConverter()  LocationVO? location, @WeatherConverter()  WeatherVO? weather, @HealthRiskConverter()  HealthRiskVO? healthRisk, @AirQualityConverter()  AirQualityVO? airQuality)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseVO() when $default != null:
return $default(_that.date,_that.id,_that.location,_that.weather,_that.healthRisk,_that.airQuality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _ApiResponseVO implements ApiResponseVO {
  const _ApiResponseVO({this.date, this.id, @LocationConverter() this.location, @WeatherConverter() this.weather, @HealthRiskConverter() this.healthRisk, @AirQualityConverter() this.airQuality});
  

@override final  DateTime? date;
@override final  int? id;
@override@LocationConverter() final  LocationVO? location;
@override@WeatherConverter() final  WeatherVO? weather;
@override@HealthRiskConverter() final  HealthRiskVO? healthRisk;
@override@AirQualityConverter() final  AirQualityVO? airQuality;

/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseVOCopyWith<_ApiResponseVO> get copyWith => __$ApiResponseVOCopyWithImpl<_ApiResponseVO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseVOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseVO&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.healthRisk, healthRisk) || other.healthRisk == healthRisk)&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,id,location,weather,healthRisk,airQuality);

@override
String toString() {
  return 'ApiResponseVO(date: $date, id: $id, location: $location, weather: $weather, healthRisk: $healthRisk, airQuality: $airQuality)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseVOCopyWith<$Res> implements $ApiResponseVOCopyWith<$Res> {
  factory _$ApiResponseVOCopyWith(_ApiResponseVO value, $Res Function(_ApiResponseVO) _then) = __$ApiResponseVOCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, int? id,@LocationConverter() LocationVO? location,@WeatherConverter() WeatherVO? weather,@HealthRiskConverter() HealthRiskVO? healthRisk,@AirQualityConverter() AirQualityVO? airQuality
});


@override $LocationVOCopyWith<$Res>? get location;@override $WeatherVOCopyWith<$Res>? get weather;@override $HealthRiskVOCopyWith<$Res>? get healthRisk;@override $AirQualityVOCopyWith<$Res>? get airQuality;

}
/// @nodoc
class __$ApiResponseVOCopyWithImpl<$Res>
    implements _$ApiResponseVOCopyWith<$Res> {
  __$ApiResponseVOCopyWithImpl(this._self, this._then);

  final _ApiResponseVO _self;
  final $Res Function(_ApiResponseVO) _then;

/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? id = freezed,Object? location = freezed,Object? weather = freezed,Object? healthRisk = freezed,Object? airQuality = freezed,}) {
  return _then(_ApiResponseVO(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationVO?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherVO?,healthRisk: freezed == healthRisk ? _self.healthRisk : healthRisk // ignore: cast_nullable_to_non_nullable
as HealthRiskVO?,airQuality: freezed == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQualityVO?,
  ));
}

/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationVOCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationVOCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherVOCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherVOCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRiskVOCopyWith<$Res>? get healthRisk {
    if (_self.healthRisk == null) {
    return null;
  }

  return $HealthRiskVOCopyWith<$Res>(_self.healthRisk!, (value) {
    return _then(_self.copyWith(healthRisk: value));
  });
}/// Create a copy of ApiResponseVO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityVOCopyWith<$Res>? get airQuality {
    if (_self.airQuality == null) {
    return null;
  }

  return $AirQualityVOCopyWith<$Res>(_self.airQuality!, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}
}

// dart format on
