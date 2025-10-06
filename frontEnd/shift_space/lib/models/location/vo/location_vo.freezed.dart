// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationVO {

 int? get id; String? get zipCode; String? get lat; String? get lon;
/// Create a copy of LocationVO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationVOCopyWith<LocationVO> get copyWith => _$LocationVOCopyWithImpl<LocationVO>(this as LocationVO, _$identity);

  /// Serializes this LocationVO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationVO&&(identical(other.id, id) || other.id == id)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,zipCode,lat,lon);

@override
String toString() {
  return 'LocationVO(id: $id, zipCode: $zipCode, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $LocationVOCopyWith<$Res>  {
  factory $LocationVOCopyWith(LocationVO value, $Res Function(LocationVO) _then) = _$LocationVOCopyWithImpl;
@useResult
$Res call({
 int? id, String? zipCode, String? lat, String? lon
});




}
/// @nodoc
class _$LocationVOCopyWithImpl<$Res>
    implements $LocationVOCopyWith<$Res> {
  _$LocationVOCopyWithImpl(this._self, this._then);

  final LocationVO _self;
  final $Res Function(LocationVO) _then;

/// Create a copy of LocationVO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? zipCode = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationVO].
extension LocationVOPatterns on LocationVO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationVO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationVO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationVO value)  $default,){
final _that = this;
switch (_that) {
case _LocationVO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationVO value)?  $default,){
final _that = this;
switch (_that) {
case _LocationVO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? zipCode,  String? lat,  String? lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationVO() when $default != null:
return $default(_that.id,_that.zipCode,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? zipCode,  String? lat,  String? lon)  $default,) {final _that = this;
switch (_that) {
case _LocationVO():
return $default(_that.id,_that.zipCode,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? zipCode,  String? lat,  String? lon)?  $default,) {final _that = this;
switch (_that) {
case _LocationVO() when $default != null:
return $default(_that.id,_that.zipCode,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _LocationVO implements LocationVO {
  const _LocationVO({this.id, this.zipCode, this.lat, this.lon});
  

@override final  int? id;
@override final  String? zipCode;
@override final  String? lat;
@override final  String? lon;

/// Create a copy of LocationVO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationVOCopyWith<_LocationVO> get copyWith => __$LocationVOCopyWithImpl<_LocationVO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationVOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationVO&&(identical(other.id, id) || other.id == id)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,zipCode,lat,lon);

@override
String toString() {
  return 'LocationVO(id: $id, zipCode: $zipCode, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$LocationVOCopyWith<$Res> implements $LocationVOCopyWith<$Res> {
  factory _$LocationVOCopyWith(_LocationVO value, $Res Function(_LocationVO) _then) = __$LocationVOCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? zipCode, String? lat, String? lon
});




}
/// @nodoc
class __$LocationVOCopyWithImpl<$Res>
    implements _$LocationVOCopyWith<$Res> {
  __$LocationVOCopyWithImpl(this._self, this._then);

  final _LocationVO _self;
  final $Res Function(_LocationVO) _then;

/// Create a copy of LocationVO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? zipCode = freezed,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_LocationVO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
