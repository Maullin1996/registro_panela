import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage4_recollection/domin/stage4_form_data.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_form_provider.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_load_provider.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_ui_provider.dart';
import 'package:registro_panela/shared/utils/tokens.dart';
import 'package:uuid/uuid.dart';

class Stage4Page extends ConsumerWidget {
  final String projectId;
  const Stage4Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(stage4UiProvider(projectId));

    final uiNotifier = ref.read(stage4UiProvider(projectId).notifier);

    final formNotifier = ref.read(stage4FormProvider.notifier);

    final formState = ref.watch(stage4FormProvider);

    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhere((p) => p.id == projectId);

    final existing = ref
        .watch(stage4LoadProvider)
        .firstWhereOrNull((element) => element.projectId == projectId);

    final isNew = existing == null;

    final uuid = Uuid();

    final hasChanges =
        isNew ||
        existing.returnedGaveras != ui.returnedGaveras ||
        existing.returnedBaskets != ui.returnedBaskets ||
        existing.returnedPreservativesJars != ui.returnedPreservativesJars ||
        existing.returnedLimeJars != ui.returnedLimeJars;

    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
        title: Text(
          'Devoluciones: ${project.name}',
          style: textTheme.headlineMedium,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.large,
        ),
        children: [
          Text('Gaveras devueltas', style: textTheme.headlineMedium),
          ...ui.returnedGaveras.asMap().entries.map((e) {
            final index = e.key;
            final returnGavera = e.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${returnGavera.referenceWeight} g',
                  style: textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: returnGavera.quantity > 0
                          ? () => uiNotifier.updateGavera(
                              index,
                              returnGavera.quantity - 1,
                            )
                          : null,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '${returnGavera.quantity}',
                      style: textTheme.bodyLarge,
                    ),
                    IconButton(
                      onPressed:
                          (project.gaveras[index].quantity ==
                              returnGavera.quantity)
                          ? null
                          : () => uiNotifier.updateGavera(
                              index,
                              returnGavera.quantity + 1,
                            ),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            );
          }),
          const SizedBox(height: AppSpacing.smallLarge),
          _buildStepper(
            textTheme: textTheme,
            maxValue: project.basketsQuantity,
            label: 'Canastillas a devolver',
            value: ui.returnedBaskets,
            onChanged: uiNotifier.updateBaskets,
          ),
          const SizedBox(height: AppSpacing.smallLarge),
          // 3) Conservantes y cal
          _buildStepper(
            textTheme: textTheme,
            maxValue: project.preservativesJars,
            label: 'Tarros de conservantes',
            value: ui.returnedPreservativesJars,
            onChanged: uiNotifier.updatePreservatives,
          ),
          const SizedBox(height: AppSpacing.smallLarge),
          _buildStepper(
            textTheme: textTheme,
            maxValue: project.limeJars,
            label: 'Tarros de cal',
            value: ui.returnedLimeJars,
            onChanged: uiNotifier.updateLime,
          ),
          const SizedBox(height: AppSpacing.medium),
          if (hasChanges)
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text(
                formState.status == Stage4FormStatus.submitting
                    ? 'Guardando...'
                    : 'Guardar cambios',
              ),
              onPressed: formState.status == Stage4FormStatus.submitting
                  ? null
                  : () {
                      final data = Stage4FormData(
                        id: existing?.id ?? uuid.v4(),
                        projectId: projectId,
                        date: DateTime.now(),
                        returnedGaveras: ui.returnedGaveras,
                        returnedBaskets: ui.returnedBaskets,
                        returnedPreservativesJars: ui.returnedPreservativesJars,
                        returnedLimeJars: ui.returnedLimeJars,
                      );
                      formNotifier.submit(data, isNew: isNew);
                    },
            ),
        ],
      ),
    );
  }

  Widget _buildStepper({
    required TextTheme textTheme,
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
    required int maxValue,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.bodyLarge),
        Row(
          children: [
            IconButton(
              onPressed: value > 0 ? () => onChanged(value - 1) : null,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Text(
              '$value',
              style: textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            IconButton(
              onPressed: (value == maxValue)
                  ? null
                  : () => onChanged(value + 1),
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}
