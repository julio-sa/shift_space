// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Weather {

 int? get id; String? get temperature; String? get humidity;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.id, id) || other.id == id)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,temperature,humidity);

@override
String toString() {
  return 'Weather(id: $id, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 int? id, String? temperature, String? humidity
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? temperature = freezed,Object? humidity = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Weather].
extension WeatherPatterns on Weather {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Weather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Weather value)  $default,){
final _that = this;
switch (_that) {
case _Weather():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Weather value)?  $default,){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? temperature,  String? humidity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.id,_that.temperature,_that.humidity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? temperature,  String? humidity)  $default,) {final _that = this;
switch (_that) {
case _Weather():
return $default(_that.id,_that.temperature,_that.humidity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? temperature,  String? humidity)?  $default,) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.id,_that.temperature,_that.humidity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _Weather implements Weather {
  const _Weather({this.id, this.temperature, this.humidity});
  

@override final  int? id;
@override final  String? temperature;
@override final  String? humidity;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.id, id) || other.id == id)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,temperature,humidity);

@override
String toString() {
  return 'Weather(id: $id, temperature: $temperature, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? temperature, String? humidity
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? temperature = freezed,Object? humidity = freezed,}) {
  return _then(_Weather(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
