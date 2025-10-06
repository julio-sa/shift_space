// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_risk_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthRiskVO {

 int? get id; String? get level; String? get label; String? get recommendation;
/// Create a copy of HealthRiskVO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthRiskVOCopyWith<HealthRiskVO> get copyWith => _$HealthRiskVOCopyWithImpl<HealthRiskVO>(this as HealthRiskVO, _$identity);

  /// Serializes this HealthRiskVO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthRiskVO&&(identical(other.id, id) || other.id == id)&&(identical(other.level, level) || other.level == level)&&(identical(other.label, label) || other.label == label)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,level,label,recommendation);

@override
String toString() {
  return 'HealthRiskVO(id: $id, level: $level, label: $label, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class $HealthRiskVOCopyWith<$Res>  {
  factory $HealthRiskVOCopyWith(HealthRiskVO value, $Res Function(HealthRiskVO) _then) = _$HealthRiskVOCopyWithImpl;
@useResult
$Res call({
 int? id, String? level, String? label, String? recommendation
});




}
/// @nodoc
class _$HealthRiskVOCopyWithImpl<$Res>
    implements $HealthRiskVOCopyWith<$Res> {
  _$HealthRiskVOCopyWithImpl(this._self, this._then);

  final HealthRiskVO _self;
  final $Res Function(HealthRiskVO) _then;

/// Create a copy of HealthRiskVO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? level = freezed,Object? label = freezed,Object? recommendation = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,recommendation: freezed == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthRiskVO].
extension HealthRiskVOPatterns on HealthRiskVO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthRiskVO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthRiskVO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthRiskVO value)  $default,){
final _that = this;
switch (_that) {
case _HealthRiskVO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthRiskVO value)?  $default,){
final _that = this;
switch (_that) {
case _HealthRiskVO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? level,  String? label,  String? recommendation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthRiskVO() when $default != null:
return $default(_that.id,_that.level,_that.label,_that.recommendation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? level,  String? label,  String? recommendation)  $default,) {final _that = this;
switch (_that) {
case _HealthRiskVO():
return $default(_that.id,_that.level,_that.label,_that.recommendation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? level,  String? label,  String? recommendation)?  $default,) {final _that = this;
switch (_that) {
case _HealthRiskVO() when $default != null:
return $default(_that.id,_that.level,_that.label,_that.recommendation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createFactory: false)

class _HealthRiskVO implements HealthRiskVO {
  const _HealthRiskVO({this.id, this.level, this.label, this.recommendation});
  

@override final  int? id;
@override final  String? level;
@override final  String? label;
@override final  String? recommendation;

/// Create a copy of HealthRiskVO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthRiskVOCopyWith<_HealthRiskVO> get copyWith => __$HealthRiskVOCopyWithImpl<_HealthRiskVO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthRiskVOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthRiskVO&&(identical(other.id, id) || other.id == id)&&(identical(other.level, level) || other.level == level)&&(identical(other.label, label) || other.label == label)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,level,label,recommendation);

@override
String toString() {
  return 'HealthRiskVO(id: $id, level: $level, label: $label, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$HealthRiskVOCopyWith<$Res> implements $HealthRiskVOCopyWith<$Res> {
  factory _$HealthRiskVOCopyWith(_HealthRiskVO value, $Res Function(_HealthRiskVO) _then) = __$HealthRiskVOCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? level, String? label, String? recommendation
});




}
/// @nodoc
class __$HealthRiskVOCopyWithImpl<$Res>
    implements _$HealthRiskVOCopyWith<$Res> {
  __$HealthRiskVOCopyWithImpl(this._self, this._then);

  final _HealthRiskVO _self;
  final $Res Function(_HealthRiskVO) _then;

/// Create a copy of HealthRiskVO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? level = freezed,Object? label = freezed,Object? recommendation = freezed,}) {
  return _then(_HealthRiskVO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,recommendation: freezed == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
