// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage1_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stage1FormData _$Stage1FormDataFromJson(Map<String, dynamic> json) =>
    _Stage1FormData(
      nombre: json['nombre'] as String,
      gaveras: (json['gaveras'] as List<dynamic>)
          .map((e) => GaveraData.fromJson(e as Map<String, dynamic>))
          .toList(),
      canastillasCantidad: (json['canastillasCantidad'] as num).toInt(),
      conservantesPeso: (json['conservantesPeso'] as num).toDouble(),
      conservantesTarros: (json['conservantesTarros'] as num).toInt(),
      calPeso: (json['calPeso'] as num).toDouble(),
      calTarros: (json['calTarros'] as num).toInt(),
      telefono: json['telefono'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      fotoPath: json['fotoPath'] as String?,
    );

Map<String, dynamic> _$Stage1FormDataToJson(_Stage1FormData instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'gaveras': instance.gaveras,
      'canastillasCantidad': instance.canastillasCantidad,
      'conservantesPeso': instance.conservantesPeso,
      'conservantesTarros': instance.conservantesTarros,
      'calPeso': instance.calPeso,
      'calTarros': instance.calTarros,
      'telefono': instance.telefono,
      'fecha': instance.fecha.toIso8601String(),
      'fotoPath': instance.fotoPath,
    };
