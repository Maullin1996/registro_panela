// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cargue_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CargueFormData _$CargueFormDataFromJson(Map<String, dynamic> json) =>
    _CargueFormData(
      projectId: json['projectId'] as String,
      canastillasCantidad: (json['canastillasCantidad'] as num).toInt(),
      gaveraPesoReferencia: (json['gaveraPesoReferencia'] as num).toDouble(),
      canastillas: (json['canastillas'] as List<dynamic>)
          .map((e) => CanastillaCargueData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CargueFormDataToJson(_CargueFormData instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'canastillasCantidad': instance.canastillasCantidad,
      'gaveraPesoReferencia': instance.gaveraPesoReferencia,
      'canastillas': instance.canastillas,
    };

_CanastillaCargueData _$CanastillaCargueDataFromJson(
  Map<String, dynamic> json,
) => _CanastillaCargueData(
  numero: (json['numero'] as num).toInt(),
  peso: (json['peso'] as num).toDouble(),
);

Map<String, dynamic> _$CanastillaCargueDataToJson(
  _CanastillaCargueData instance,
) => <String, dynamic>{'numero': instance.numero, 'peso': instance.peso};
