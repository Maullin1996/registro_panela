// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gavera_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GaveraData _$GaveraDataFromJson(Map<String, dynamic> json) => _GaveraData(
  cantidad: (json['cantidad'] as num).toInt(),
  pesoReferencia: (json['pesoReferencia'] as num).toDouble(),
);

Map<String, dynamic> _$GaveraDataToJson(_GaveraData instance) =>
    <String, dynamic>{
      'cantidad': instance.cantidad,
      'pesoReferencia': instance.pesoReferencia,
    };
