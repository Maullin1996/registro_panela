// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gavera_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GaveraData {

 int get cantidad; double get pesoReferencia;
/// Create a copy of GaveraData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GaveraDataCopyWith<GaveraData> get copyWith => _$GaveraDataCopyWithImpl<GaveraData>(this as GaveraData, _$identity);

  /// Serializes this GaveraData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GaveraData&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.pesoReferencia, pesoReferencia) || other.pesoReferencia == pesoReferencia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cantidad,pesoReferencia);

@override
String toString() {
  return 'GaveraData(cantidad: $cantidad, pesoReferencia: $pesoReferencia)';
}


}

/// @nodoc
abstract mixin class $GaveraDataCopyWith<$Res>  {
  factory $GaveraDataCopyWith(GaveraData value, $Res Function(GaveraData) _then) = _$GaveraDataCopyWithImpl;
@useResult
$Res call({
 int cantidad, double pesoReferencia
});




}
/// @nodoc
class _$GaveraDataCopyWithImpl<$Res>
    implements $GaveraDataCopyWith<$Res> {
  _$GaveraDataCopyWithImpl(this._self, this._then);

  final GaveraData _self;
  final $Res Function(GaveraData) _then;

/// Create a copy of GaveraData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cantidad = null,Object? pesoReferencia = null,}) {
  return _then(_self.copyWith(
cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,pesoReferencia: null == pesoReferencia ? _self.pesoReferencia : pesoReferencia // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GaveraData].
extension GaveraDataPatterns on GaveraData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GaveraData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GaveraData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GaveraData value)  $default,){
final _that = this;
switch (_that) {
case _GaveraData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GaveraData value)?  $default,){
final _that = this;
switch (_that) {
case _GaveraData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cantidad,  double pesoReferencia)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GaveraData() when $default != null:
return $default(_that.cantidad,_that.pesoReferencia);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cantidad,  double pesoReferencia)  $default,) {final _that = this;
switch (_that) {
case _GaveraData():
return $default(_that.cantidad,_that.pesoReferencia);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cantidad,  double pesoReferencia)?  $default,) {final _that = this;
switch (_that) {
case _GaveraData() when $default != null:
return $default(_that.cantidad,_that.pesoReferencia);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GaveraData implements GaveraData {
  const _GaveraData({required this.cantidad, required this.pesoReferencia});
  factory _GaveraData.fromJson(Map<String, dynamic> json) => _$GaveraDataFromJson(json);

@override final  int cantidad;
@override final  double pesoReferencia;

/// Create a copy of GaveraData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GaveraDataCopyWith<_GaveraData> get copyWith => __$GaveraDataCopyWithImpl<_GaveraData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GaveraDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GaveraData&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.pesoReferencia, pesoReferencia) || other.pesoReferencia == pesoReferencia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cantidad,pesoReferencia);

@override
String toString() {
  return 'GaveraData(cantidad: $cantidad, pesoReferencia: $pesoReferencia)';
}


}

/// @nodoc
abstract mixin class _$GaveraDataCopyWith<$Res> implements $GaveraDataCopyWith<$Res> {
  factory _$GaveraDataCopyWith(_GaveraData value, $Res Function(_GaveraData) _then) = __$GaveraDataCopyWithImpl;
@override @useResult
$Res call({
 int cantidad, double pesoReferencia
});




}
/// @nodoc
class __$GaveraDataCopyWithImpl<$Res>
    implements _$GaveraDataCopyWith<$Res> {
  __$GaveraDataCopyWithImpl(this._self, this._then);

  final _GaveraData _self;
  final $Res Function(_GaveraData) _then;

/// Create a copy of GaveraData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cantidad = null,Object? pesoReferencia = null,}) {
  return _then(_GaveraData(
cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,pesoReferencia: null == pesoReferencia ? _self.pesoReferencia : pesoReferencia // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
