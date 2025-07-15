import 'package:collection/collection.dart';
import 'package:registro_panela/features/stage1_delivery/data/mock_stage1_projects.dart';
import 'package:registro_panela/features/stage1_delivery/domain/stage1_form_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage1_projects_provider.g.dart';

@riverpod
class Stage1Projects extends _$Stage1Projects {
  @override
  List<Stage1FormData> build() {
    return mockStage1Projects;
  }

  void add(Stage1FormData project) {
    state = [...state, project];
  }

  void update(Stage1FormData updatedProject) {
    state = [
      for (final Stage1FormData p in state)
        if (p.id == updatedProject.id) updatedProject else p,
    ];
  }

  void removeById(String id) {
    state = state.where((p) => p.id != id).toList();
  }

  Stage1FormData? getById(String id) {
    return state.firstWhereOrNull((p) => p.id == id);
  }

  void loadFromBackend(List<Stage1FormData> projectsFromApi) {
    state = projectsFromApi;
  }

  Future<void> fetchFromBackend() async {
    // final fetched = await tuApi.getProjects();
    // state = fetched;
  }
}
