import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_panela/features/stage1_delivery/domin/gavera_data.dart';

part 'stage1_form_data.freezed.dart';
part 'stage1_form_data.g.dart';

@freezed
abstract class Stage1FormData with _$Stage1FormData {
  factory Stage1FormData({
    required String nombre,
    required List<GaveraData> gaveras,
    required int canastillasCantidad,
    required double conservantesPeso,
    required int conservantesTarros,
    required double calPeso,
    required int calTarros,
    required String telefono,
    required DateTime fecha,
    String? fotoPath,
  }) = _Stage1FormData;

  factory Stage1FormData.fromJson(Map<String, dynamic> json) =>
      _$Stage1FormDataFromJson(json);
}
