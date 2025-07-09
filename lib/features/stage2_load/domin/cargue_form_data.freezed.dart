// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cargue_form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CargueFormData {

 String get projectId; int get canastillasCantidad; double get gaveraPesoReferencia; List<CanastillaCargueData> get canastillas;
/// Create a copy of CargueFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CargueFormDataCopyWith<CargueFormData> get copyWith => _$CargueFormDataCopyWithImpl<CargueFormData>(this as CargueFormData, _$identity);

  /// Serializes this CargueFormData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CargueFormData&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.canastillasCantidad, canastillasCantidad) || other.canastillasCantidad == canastillasCantidad)&&(identical(other.gaveraPesoReferencia, gaveraPesoReferencia) || other.gaveraPesoReferencia == gaveraPesoReferencia)&&const DeepCollectionEquality().equals(other.canastillas, canastillas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,canastillasCantidad,gaveraPesoReferencia,const DeepCollectionEquality().hash(canastillas));

@override
String toString() {
  return 'CargueFormData(projectId: $projectId, canastillasCantidad: $canastillasCantidad, gaveraPesoReferencia: $gaveraPesoReferencia, canastillas: $canastillas)';
}


}

/// @nodoc
abstract mixin class $CargueFormDataCopyWith<$Res>  {
  factory $CargueFormDataCopyWith(CargueFormData value, $Res Function(CargueFormData) _then) = _$CargueFormDataCopyWithImpl;
@useResult
$Res call({
 String projectId, int canastillasCantidad, double gaveraPesoReferencia, List<CanastillaCargueData> canastillas
});




}
/// @nodoc
class _$CargueFormDataCopyWithImpl<$Res>
    implements $CargueFormDataCopyWith<$Res> {
  _$CargueFormDataCopyWithImpl(this._self, this._then);

  final CargueFormData _self;
  final $Res Function(CargueFormData) _then;

/// Create a copy of CargueFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? canastillasCantidad = null,Object? gaveraPesoReferencia = null,Object? canastillas = null,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,canastillasCantidad: null == canastillasCantidad ? _self.canastillasCantidad : canastillasCantidad // ignore: cast_nullable_to_non_nullable
as int,gaveraPesoReferencia: null == gaveraPesoReferencia ? _self.gaveraPesoReferencia : gaveraPesoReferencia // ignore: cast_nullable_to_non_nullable
as double,canastillas: null == canastillas ? _self.canastillas : canastillas // ignore: cast_nullable_to_non_nullable
as List<CanastillaCargueData>,
  ));
}

}


/// Adds pattern-matching-related methods to [CargueFormData].
extension CargueFormDataPatterns on CargueFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CargueFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CargueFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CargueFormData value)  $default,){
final _that = this;
switch (_that) {
case _CargueFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CargueFormData value)?  $default,){
final _that = this;
switch (_that) {
case _CargueFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  int canastillasCantidad,  double gaveraPesoReferencia,  List<CanastillaCargueData> canastillas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CargueFormData() when $default != null:
return $default(_that.projectId,_that.canastillasCantidad,_that.gaveraPesoReferencia,_that.canastillas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  int canastillasCantidad,  double gaveraPesoReferencia,  List<CanastillaCargueData> canastillas)  $default,) {final _that = this;
switch (_that) {
case _CargueFormData():
return $default(_that.projectId,_that.canastillasCantidad,_that.gaveraPesoReferencia,_that.canastillas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  int canastillasCantidad,  double gaveraPesoReferencia,  List<CanastillaCargueData> canastillas)?  $default,) {final _that = this;
switch (_that) {
case _CargueFormData() when $default != null:
return $default(_that.projectId,_that.canastillasCantidad,_that.gaveraPesoReferencia,_that.canastillas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CargueFormData implements CargueFormData {
   _CargueFormData({required this.projectId, required this.canastillasCantidad, required this.gaveraPesoReferencia, required final  List<CanastillaCargueData> canastillas}): _canastillas = canastillas;
  factory _CargueFormData.fromJson(Map<String, dynamic> json) => _$CargueFormDataFromJson(json);

@override final  String projectId;
@override final  int canastillasCantidad;
@override final  double gaveraPesoReferencia;
 final  List<CanastillaCargueData> _canastillas;
@override List<CanastillaCargueData> get canastillas {
  if (_canastillas is EqualUnmodifiableListView) return _canastillas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_canastillas);
}


/// Create a copy of CargueFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CargueFormDataCopyWith<_CargueFormData> get copyWith => __$CargueFormDataCopyWithImpl<_CargueFormData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CargueFormDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CargueFormData&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.canastillasCantidad, canastillasCantidad) || other.canastillasCantidad == canastillasCantidad)&&(identical(other.gaveraPesoReferencia, gaveraPesoReferencia) || other.gaveraPesoReferencia == gaveraPesoReferencia)&&const DeepCollectionEquality().equals(other._canastillas, _canastillas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,canastillasCantidad,gaveraPesoReferencia,const DeepCollectionEquality().hash(_canastillas));

@override
String toString() {
  return 'CargueFormData(projectId: $projectId, canastillasCantidad: $canastillasCantidad, gaveraPesoReferencia: $gaveraPesoReferencia, canastillas: $canastillas)';
}


}

/// @nodoc
abstract mixin class _$CargueFormDataCopyWith<$Res> implements $CargueFormDataCopyWith<$Res> {
  factory _$CargueFormDataCopyWith(_CargueFormData value, $Res Function(_CargueFormData) _then) = __$CargueFormDataCopyWithImpl;
@override @useResult
$Res call({
 String projectId, int canastillasCantidad, double gaveraPesoReferencia, List<CanastillaCargueData> canastillas
});




}
/// @nodoc
class __$CargueFormDataCopyWithImpl<$Res>
    implements _$CargueFormDataCopyWith<$Res> {
  __$CargueFormDataCopyWithImpl(this._self, this._then);

  final _CargueFormData _self;
  final $Res Function(_CargueFormData) _then;

/// Create a copy of CargueFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? canastillasCantidad = null,Object? gaveraPesoReferencia = null,Object? canastillas = null,}) {
  return _then(_CargueFormData(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,canastillasCantidad: null == canastillasCantidad ? _self.canastillasCantidad : canastillasCantidad // ignore: cast_nullable_to_non_nullable
as int,gaveraPesoReferencia: null == gaveraPesoReferencia ? _self.gaveraPesoReferencia : gaveraPesoReferencia // ignore: cast_nullable_to_non_nullable
as double,canastillas: null == canastillas ? _self._canastillas : canastillas // ignore: cast_nullable_to_non_nullable
as List<CanastillaCargueData>,
  ));
}


}


/// @nodoc
mixin _$CanastillaCargueData {

 int get numero; double get peso;
/// Create a copy of CanastillaCargueData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanastillaCargueDataCopyWith<CanastillaCargueData> get copyWith => _$CanastillaCargueDataCopyWithImpl<CanastillaCargueData>(this as CanastillaCargueData, _$identity);

  /// Serializes this CanastillaCargueData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanastillaCargueData&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.peso, peso) || other.peso == peso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numero,peso);

@override
String toString() {
  return 'CanastillaCargueData(numero: $numero, peso: $peso)';
}


}

/// @nodoc
abstract mixin class $CanastillaCargueDataCopyWith<$Res>  {
  factory $CanastillaCargueDataCopyWith(CanastillaCargueData value, $Res Function(CanastillaCargueData) _then) = _$CanastillaCargueDataCopyWithImpl;
@useResult
$Res call({
 int numero, double peso
});




}
/// @nodoc
class _$CanastillaCargueDataCopyWithImpl<$Res>
    implements $CanastillaCargueDataCopyWith<$Res> {
  _$CanastillaCargueDataCopyWithImpl(this._self, this._then);

  final CanastillaCargueData _self;
  final $Res Function(CanastillaCargueData) _then;

/// Create a copy of CanastillaCargueData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numero = null,Object? peso = null,}) {
  return _then(_self.copyWith(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,peso: null == peso ? _self.peso : peso // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CanastillaCargueData].
extension CanastillaCargueDataPatterns on CanastillaCargueData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanastillaCargueData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanastillaCargueData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanastillaCargueData value)  $default,){
final _that = this;
switch (_that) {
case _CanastillaCargueData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanastillaCargueData value)?  $default,){
final _that = this;
switch (_that) {
case _CanastillaCargueData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int numero,  double peso)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanastillaCargueData() when $default != null:
return $default(_that.numero,_that.peso);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int numero,  double peso)  $default,) {final _that = this;
switch (_that) {
case _CanastillaCargueData():
return $default(_that.numero,_that.peso);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int numero,  double peso)?  $default,) {final _that = this;
switch (_that) {
case _CanastillaCargueData() when $default != null:
return $default(_that.numero,_that.peso);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanastillaCargueData implements CanastillaCargueData {
   _CanastillaCargueData({required this.numero, required this.peso});
  factory _CanastillaCargueData.fromJson(Map<String, dynamic> json) => _$CanastillaCargueDataFromJson(json);

@override final  int numero;
@override final  double peso;

/// Create a copy of CanastillaCargueData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanastillaCargueDataCopyWith<_CanastillaCargueData> get copyWith => __$CanastillaCargueDataCopyWithImpl<_CanastillaCargueData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanastillaCargueDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanastillaCargueData&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.peso, peso) || other.peso == peso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,numero,peso);

@override
String toString() {
  return 'CanastillaCargueData(numero: $numero, peso: $peso)';
}


}

/// @nodoc
abstract mixin class _$CanastillaCargueDataCopyWith<$Res> implements $CanastillaCargueDataCopyWith<$Res> {
  factory _$CanastillaCargueDataCopyWith(_CanastillaCargueData value, $Res Function(_CanastillaCargueData) _then) = __$CanastillaCargueDataCopyWithImpl;
@override @useResult
$Res call({
 int numero, double peso
});




}
/// @nodoc
class __$CanastillaCargueDataCopyWithImpl<$Res>
    implements _$CanastillaCargueDataCopyWith<$Res> {
  __$CanastillaCargueDataCopyWithImpl(this._self, this._then);

  final _CanastillaCargueData _self;
  final $Res Function(_CanastillaCargueData) _then;

/// Create a copy of CanastillaCargueData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numero = null,Object? peso = null,}) {
  return _then(_CanastillaCargueData(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,peso: null == peso ? _self.peso : peso // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
