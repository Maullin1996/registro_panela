import 'package:registro_panela/features/stage5_2_records/domain/stage52_record_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage52_load_provider.g.dart';

@riverpod
class Stage52Load extends _$Stage52Load {
  @override
  List<Stage52RecordData> build() => [];

  void add(Stage52RecordData record) {
    state = [record, ...state];
  }

  void remove(String id) {
    state = state.where((r) => r.id != id).toList();
  }
}
