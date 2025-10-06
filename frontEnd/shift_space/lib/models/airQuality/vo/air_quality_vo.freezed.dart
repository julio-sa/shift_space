// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirQualityVO {

 String? get pm25; String? get o3;
/// Create a copy of AirQualityVO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityVOCopyWith<AirQualityVO> get copyWith => _$AirQualityVOCopyWithImpl<AirQualityVO>(this as AirQualityVO, _$identity);

  /// Serializes this AirQualityVO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityVO&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.o3, o3) || other.o3 == o3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm25,o3);

@override
String toString() {
  return 'AirQualityVO(pm25: $pm25, o3: $o3)';
}


}

/// @nodoc
abstract mixin class $AirQualityVOCopyWith<$Res>  {
  factory $AirQualityVOCopyWith(AirQualityVO value, $Res Function(AirQualityVO) _then) = _$AirQualityVOCopyWithImpl;
@useResult
$Res call({
 String? pm25, String? o3
});




}
/// @nodoc
class _$AirQualityVOCopyWithImpl<$Res>
    implements $AirQualityVOCopyWith<$Res> {
  _$AirQualityVOCopyWithImpl(this._self, this._then);

  final AirQualityVO _self;
  final $Res Function(AirQualityVO) _then;

/// Create a copy of AirQualityVO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pm25 = freezed,Object? o3 = freezed,}) {
  return _then(_self.copyWith(
pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as String?,o3: freezed == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityVO].
extension AirQualityVOPatterns on AirQualityVO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityVO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityVO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityVO value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityVO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityVO value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityVO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? pm25,  String? o3)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityVO() when $default != null:
return $default(_that.pm25,_that.o3);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? pm25,  String? o3)  $default,) {final _that = this;
switch (_that) {
case _AirQualityVO():
return $default(_that.pm25,_that.o3);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? pm25,  String? o3)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityVO() when $default != null:
return $default(_that.pm25,_that.o3);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _AirQualityVO implements AirQualityVO {
  const _AirQualityVO({this.pm25, this.o3});
  

@override final  String? pm25;
@override final  String? o3;

/// Create a copy of AirQualityVO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityVOCopyWith<_AirQualityVO> get copyWith => __$AirQualityVOCopyWithImpl<_AirQualityVO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityVOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityVO&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&(identical(other.o3, o3) || other.o3 == o3));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pm25,o3);

@override
String toString() {
  return 'AirQualityVO(pm25: $pm25, o3: $o3)';
}


}

/// @nodoc
abstract mixin class _$AirQualityVOCopyWith<$Res> implements $AirQualityVOCopyWith<$Res> {
  factory _$AirQualityVOCopyWith(_AirQualityVO value, $Res Function(_AirQualityVO) _then) = __$AirQualityVOCopyWithImpl;
@override @useResult
$Res call({
 String? pm25, String? o3
});




}
/// @nodoc
class __$AirQualityVOCopyWithImpl<$Res>
    implements _$AirQualityVOCopyWith<$Res> {
  __$AirQualityVOCopyWithImpl(this._self, this._then);

  final _AirQualityVO _self;
  final $Res Function(_AirQualityVO) _then;

/// Create a copy of AirQualityVO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pm25 = freezed,Object? o3 = freezed,}) {
  return _then(_AirQualityVO(
pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as String?,o3: freezed == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
