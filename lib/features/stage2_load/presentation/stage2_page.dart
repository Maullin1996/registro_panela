import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage2_load/presentation/widgets/stage2_load_form.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_load_form_provider.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_load_provider.dart';
import 'package:registro_panela/shared/utils/tokens.dart';

import 'package:registro_panela/shared/widgets/custom_card.dart';
import 'package:registro_panela/shared/widgets/custom_rich_text.dart';

class Stage2Page extends ConsumerWidget {
  final String projectId;
  const Stage2Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(stage2FormProvider, (previous, next) {
      if (previous?.status == Stage2FormStatus.submitting &&
          next.status == Stage2FormStatus.success) {
        context.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Cargue registrado')));
      }
      if (next.status == Stage2FormStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? 'Error al guardar')),
        );
      }
    });
    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhereOrNull((p) => p.id == projectId);

    final loads = ref
        .watch(stage2LoadProvider)
        .where((l) => l.projectId == projectId)
        .toList();

    if (project == null) {
      return const Scaffold(
        body: Center(child: Text('Proyecto no encontrado')),
      );
    }

    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cargues ${project.name}', style: textTheme.headlineMedium),
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
      ),
      body: loads.isEmpty
          ? const Center(child: Text('Aún no hay cargues registrados'))
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: AppSpacing.medium),
              itemCount: loads.length,
              itemBuilder: (BuildContext context, int index) {
                final load = loads[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dctx) => AlertDialog(
                        title: Text(
                          '¿Editar este cargue?',
                          style: textTheme.headlineMedium,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dctx),
                            child: Text(
                              'Cancelar',
                              style: textTheme.headlineSmall,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dctx);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Stage2LoadForm(
                                    project: project,
                                    initialData: load,
                                    isNew: false,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Editar',
                              style: textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(
                          icon: Icons.calendar_month,
                          firstText: 'Fecha: ',
                          secondText: DateFormat.yMd().format(load.date),
                        ),

                        const SizedBox(height: AppSpacing.xSmall),
                        CustomRichText(
                          icon: Icons.shopping_basket,
                          firstText: 'Canastillas: ',
                          secondText: load.baskets.count.toString(),
                        ),

                        const SizedBox(height: AppSpacing.xSmall),
                        CustomRichText(
                          icon: Icons.scale,
                          firstText: 'Peso: ',
                          secondText:
                              '${load.baskets.realWeight.toStringAsFixed(2)} kg',
                        ),

                        const SizedBox(height: AppSpacing.xSmall),
                        CustomRichText(
                          icon: Icons.storage_outlined,
                          firstText: 'Gavera: ',
                          secondText: '${load.baskets.referenceWeight} g',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text('Nuevo cargue'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Stage2LoadForm(isNew: true, project: project),
            ),
          );
        },
      ),
    );
  }
}
