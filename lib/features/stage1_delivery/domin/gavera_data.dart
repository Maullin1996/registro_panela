import 'package:freezed_annotation/freezed_annotation.dart';

part 'gavera_data.freezed.dart';
part 'gavera_data.g.dart';

@freezed
abstract class GaveraData with _$GaveraData {
  const factory GaveraData({
    required int cantidad,
    required double pesoReferencia,
  }) = _GaveraData;

  factory GaveraData.fromJson(Map<String, dynamic> json) =>
      _$GaveraDataFromJson(json);
}
