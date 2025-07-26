import 'package:collection/collection.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_project_by_id_provider.dart';
import 'package:registro_panela/features/stage4_recollection/domin/stage4_form_data.dart';
import 'package:registro_panela/features/stage4_recollection/domin/stage4_ui_state.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_load_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage4_ui_provider.g.dart';

@riverpod
class Stage4Ui extends _$Stage4Ui {
  @override
  Stage4UiState build(String projectId) {
    final existing = ref
        .watch(stage4LoadProvider)
        .firstWhereOrNull((e) => e.projectId == projectId);

    final project = ref.watch(stage1ProjectByIdProvider(projectId))!;

    final initialGaveras = project.gaveras
        .map(
          (g) =>
              ReturnedGaveras(quantity: 0, referenceWeight: g.referenceWeight),
        )
        .toList();
    return existing != null
        ? Stage4UiState(
            returnedGaveras: existing.returnedGaveras,
            returnedBaskets: existing.returnedBaskets,
            returnedPreservativesJars: existing.returnedPreservativesJars,
            returnedLimeJars: existing.returnedLimeJars,
          )
        : Stage4UiState(
            returnedGaveras: initialGaveras,
            returnedBaskets: 0,
            returnedPreservativesJars: 0,
            returnedLimeJars: 0,
          );
  }

  void updateGavera(int index, int quantity) {
    final list = [...state.returnedGaveras];
    list[index] = list[index].copyWith(quantity: quantity);
    state = state.copyWith(returnedGaveras: list);
  }

  void updateBaskets(int baskets) =>
      state = state.copyWith(returnedBaskets: baskets);

  void updatePreservatives(int jars) =>
      state = state.copyWith(returnedPreservativesJars: jars);

  void updateLime(int limeJarm) =>
      state = state.copyWith(returnedLimeJars: limeJarm);
}
