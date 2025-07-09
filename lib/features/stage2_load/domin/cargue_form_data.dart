import 'package:freezed_annotation/freezed_annotation.dart';

part 'cargue_form_data.freezed.dart';
part 'cargue_form_data.g.dart';

@freezed
abstract class CargueFormData with _$CargueFormData {
  factory CargueFormData({
    required String projectId,
    required int canastillasCantidad,
    required double gaveraPesoReferencia,
    required List<CanastillaCargueData> canastillas,
  }) = _CargueFormData;

  factory CargueFormData.fromJson(Map<String, dynamic> json) =>
      _$CargueFormDataFromJson(json);
}

@freezed
abstract class CanastillaCargueData with _$CanastillaCargueData {
  factory CanastillaCargueData({required int numero, required double peso}) =
      _CanastillaCargueData;

  factory CanastillaCargueData.fromJson(Map<String, dynamic> json) =>
      _$CanastillaCargueDataFromJson(json);
}
