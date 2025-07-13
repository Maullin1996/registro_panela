import 'package:collection/collection.dart';
import 'package:registro_panela/features/stage2_load/domin/stage2_load_data.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_loads_mock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage2_load_provider.g.dart';

@riverpod
class Stage2Load extends _$Stage2Load {
  @override
  List<Stage2LoadData> build() => ref.read(stage2ProjectMockProvider);

  void add(Stage2LoadData load) {
    state = [load, ...state];
  }

  void update(Stage2LoadData updatedLoad) {
    state = [
      for (final Stage2LoadData l in state)
        if (l.projectId == updatedLoad.projectId) updatedLoad else l,
    ];
  }

  void remove(String id) {
    state = state.where((l) => l.id != id).toList();
  }

  List<Stage2LoadData> getByProjectId(String projectId) {
    return state.where((l) => l.projectId == projectId).toList();
  }

  Stage2LoadData? getById(String projectId) {
    return state.firstWhereOrNull((l) => l.projectId == projectId);
  }
}
