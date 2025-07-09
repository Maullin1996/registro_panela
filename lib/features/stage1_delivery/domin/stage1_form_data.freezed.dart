// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage1_form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stage1FormData {

 String get nombre; List<GaveraData> get gaveras; int get canastillasCantidad; double get conservantesPeso; int get conservantesTarros; double get calPeso; int get calTarros; String get telefono; DateTime get fecha; String? get fotoPath;
/// Create a copy of Stage1FormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Stage1FormDataCopyWith<Stage1FormData> get copyWith => _$Stage1FormDataCopyWithImpl<Stage1FormData>(this as Stage1FormData, _$identity);

  /// Serializes this Stage1FormData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stage1FormData&&(identical(other.nombre, nombre) || other.nombre == nombre)&&const DeepCollectionEquality().equals(other.gaveras, gaveras)&&(identical(other.canastillasCantidad, canastillasCantidad) || other.canastillasCantidad == canastillasCantidad)&&(identical(other.conservantesPeso, conservantesPeso) || other.conservantesPeso == conservantesPeso)&&(identical(other.conservantesTarros, conservantesTarros) || other.conservantesTarros == conservantesTarros)&&(identical(other.calPeso, calPeso) || other.calPeso == calPeso)&&(identical(other.calTarros, calTarros) || other.calTarros == calTarros)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.fotoPath, fotoPath) || other.fotoPath == fotoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nombre,const DeepCollectionEquality().hash(gaveras),canastillasCantidad,conservantesPeso,conservantesTarros,calPeso,calTarros,telefono,fecha,fotoPath);

@override
String toString() {
  return 'Stage1FormData(nombre: $nombre, gaveras: $gaveras, canastillasCantidad: $canastillasCantidad, conservantesPeso: $conservantesPeso, conservantesTarros: $conservantesTarros, calPeso: $calPeso, calTarros: $calTarros, telefono: $telefono, fecha: $fecha, fotoPath: $fotoPath)';
}


}

/// @nodoc
abstract mixin class $Stage1FormDataCopyWith<$Res>  {
  factory $Stage1FormDataCopyWith(Stage1FormData value, $Res Function(Stage1FormData) _then) = _$Stage1FormDataCopyWithImpl;
@useResult
$Res call({
 String nombre, List<GaveraData> gaveras, int canastillasCantidad, double conservantesPeso, int conservantesTarros, double calPeso, int calTarros, String telefono, DateTime fecha, String? fotoPath
});




}
/// @nodoc
class _$Stage1FormDataCopyWithImpl<$Res>
    implements $Stage1FormDataCopyWith<$Res> {
  _$Stage1FormDataCopyWithImpl(this._self, this._then);

  final Stage1FormData _self;
  final $Res Function(Stage1FormData) _then;

/// Create a copy of Stage1FormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nombre = null,Object? gaveras = null,Object? canastillasCantidad = null,Object? conservantesPeso = null,Object? conservantesTarros = null,Object? calPeso = null,Object? calTarros = null,Object? telefono = null,Object? fecha = null,Object? fotoPath = freezed,}) {
  return _then(_self.copyWith(
nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,gaveras: null == gaveras ? _self.gaveras : gaveras // ignore: cast_nullable_to_non_nullable
as List<GaveraData>,canastillasCantidad: null == canastillasCantidad ? _self.canastillasCantidad : canastillasCantidad // ignore: cast_nullable_to_non_nullable
as int,conservantesPeso: null == conservantesPeso ? _self.conservantesPeso : conservantesPeso // ignore: cast_nullable_to_non_nullable
as double,conservantesTarros: null == conservantesTarros ? _self.conservantesTarros : conservantesTarros // ignore: cast_nullable_to_non_nullable
as int,calPeso: null == calPeso ? _self.calPeso : calPeso // ignore: cast_nullable_to_non_nullable
as double,calTarros: null == calTarros ? _self.calTarros : calTarros // ignore: cast_nullable_to_non_nullable
as int,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,fotoPath: freezed == fotoPath ? _self.fotoPath : fotoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Stage1FormData].
extension Stage1FormDataPatterns on Stage1FormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stage1FormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stage1FormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stage1FormData value)  $default,){
final _that = this;
switch (_that) {
case _Stage1FormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stage1FormData value)?  $default,){
final _that = this;
switch (_that) {
case _Stage1FormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nombre,  List<GaveraData> gaveras,  int canastillasCantidad,  double conservantesPeso,  int conservantesTarros,  double calPeso,  int calTarros,  String telefono,  DateTime fecha,  String? fotoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stage1FormData() when $default != null:
return $default(_that.nombre,_that.gaveras,_that.canastillasCantidad,_that.conservantesPeso,_that.conservantesTarros,_that.calPeso,_that.calTarros,_that.telefono,_that.fecha,_that.fotoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nombre,  List<GaveraData> gaveras,  int canastillasCantidad,  double conservantesPeso,  int conservantesTarros,  double calPeso,  int calTarros,  String telefono,  DateTime fecha,  String? fotoPath)  $default,) {final _that = this;
switch (_that) {
case _Stage1FormData():
return $default(_that.nombre,_that.gaveras,_that.canastillasCantidad,_that.conservantesPeso,_that.conservantesTarros,_that.calPeso,_that.calTarros,_that.telefono,_that.fecha,_that.fotoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nombre,  List<GaveraData> gaveras,  int canastillasCantidad,  double conservantesPeso,  int conservantesTarros,  double calPeso,  int calTarros,  String telefono,  DateTime fecha,  String? fotoPath)?  $default,) {final _that = this;
switch (_that) {
case _Stage1FormData() when $default != null:
return $default(_that.nombre,_that.gaveras,_that.canastillasCantidad,_that.conservantesPeso,_that.conservantesTarros,_that.calPeso,_that.calTarros,_that.telefono,_that.fecha,_that.fotoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stage1FormData implements Stage1FormData {
   _Stage1FormData({required this.nombre, required final  List<GaveraData> gaveras, required this.canastillasCantidad, required this.conservantesPeso, required this.conservantesTarros, required this.calPeso, required this.calTarros, required this.telefono, required this.fecha, this.fotoPath}): _gaveras = gaveras;
  factory _Stage1FormData.fromJson(Map<String, dynamic> json) => _$Stage1FormDataFromJson(json);

@override final  String nombre;
 final  List<GaveraData> _gaveras;
@override List<GaveraData> get gaveras {
  if (_gaveras is EqualUnmodifiableListView) return _gaveras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gaveras);
}

@override final  int canastillasCantidad;
@override final  double conservantesPeso;
@override final  int conservantesTarros;
@override final  double calPeso;
@override final  int calTarros;
@override final  String telefono;
@override final  DateTime fecha;
@override final  String? fotoPath;

/// Create a copy of Stage1FormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Stage1FormDataCopyWith<_Stage1FormData> get copyWith => __$Stage1FormDataCopyWithImpl<_Stage1FormData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Stage1FormDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stage1FormData&&(identical(other.nombre, nombre) || other.nombre == nombre)&&const DeepCollectionEquality().equals(other._gaveras, _gaveras)&&(identical(other.canastillasCantidad, canastillasCantidad) || other.canastillasCantidad == canastillasCantidad)&&(identical(other.conservantesPeso, conservantesPeso) || other.conservantesPeso == conservantesPeso)&&(identical(other.conservantesTarros, conservantesTarros) || other.conservantesTarros == conservantesTarros)&&(identical(other.calPeso, calPeso) || other.calPeso == calPeso)&&(identical(other.calTarros, calTarros) || other.calTarros == calTarros)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.fotoPath, fotoPath) || other.fotoPath == fotoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nombre,const DeepCollectionEquality().hash(_gaveras),canastillasCantidad,conservantesPeso,conservantesTarros,calPeso,calTarros,telefono,fecha,fotoPath);

@override
String toString() {
  return 'Stage1FormData(nombre: $nombre, gaveras: $gaveras, canastillasCantidad: $canastillasCantidad, conservantesPeso: $conservantesPeso, conservantesTarros: $conservantesTarros, calPeso: $calPeso, calTarros: $calTarros, telefono: $telefono, fecha: $fecha, fotoPath: $fotoPath)';
}


}

/// @nodoc
abstract mixin class _$Stage1FormDataCopyWith<$Res> implements $Stage1FormDataCopyWith<$Res> {
  factory _$Stage1FormDataCopyWith(_Stage1FormData value, $Res Function(_Stage1FormData) _then) = __$Stage1FormDataCopyWithImpl;
@override @useResult
$Res call({
 String nombre, List<GaveraData> gaveras, int canastillasCantidad, double conservantesPeso, int conservantesTarros, double calPeso, int calTarros, String telefono, DateTime fecha, String? fotoPath
});




}
/// @nodoc
class __$Stage1FormDataCopyWithImpl<$Res>
    implements _$Stage1FormDataCopyWith<$Res> {
  __$Stage1FormDataCopyWithImpl(this._self, this._then);

  final _Stage1FormData _self;
  final $Res Function(_Stage1FormData) _then;

/// Create a copy of Stage1FormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nombre = null,Object? gaveras = null,Object? canastillasCantidad = null,Object? conservantesPeso = null,Object? conservantesTarros = null,Object? calPeso = null,Object? calTarros = null,Object? telefono = null,Object? fecha = null,Object? fotoPath = freezed,}) {
  return _then(_Stage1FormData(
nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,gaveras: null == gaveras ? _self._gaveras : gaveras // ignore: cast_nullable_to_non_nullable
as List<GaveraData>,canastillasCantidad: null == canastillasCantidad ? _self.canastillasCantidad : canastillasCantidad // ignore: cast_nullable_to_non_nullable
as int,conservantesPeso: null == conservantesPeso ? _self.conservantesPeso : conservantesPeso // ignore: cast_nullable_to_non_nullable
as double,conservantesTarros: null == conservantesTarros ? _self.conservantesTarros : conservantesTarros // ignore: cast_nullable_to_non_nullable
as int,calPeso: null == calPeso ? _self.calPeso : calPeso // ignore: cast_nullable_to_non_nullable
as double,calTarros: null == calTarros ? _self.calTarros : calTarros // ignore: cast_nullable_to_non_nullable
as int,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,fotoPath: freezed == fotoPath ? _self.fotoPath : fotoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
