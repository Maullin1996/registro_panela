import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage2_load/presentation/widgets/stage2_load_form.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_load_provider.dart';

class Stage2Page extends ConsumerWidget {
  final String projectId;
  const Stage2Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Cargues de ${project.name}'),
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
      ),
      body: loads.isEmpty
          ? const Center(child: Text('Aún no hay cargues registrados'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: loads.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (BuildContext context, int index) {
                final load = loads[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dctx) => AlertDialog(
                        title: const Text('¿Editar este cargue?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(dctx),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dctx);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Stage2LoadForm(
                                    project: project,
                                    initialData: load,
                                    isNew: false,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Editar'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecha: ${DateFormat.yMd().format(load.date)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Cantidad de canastillas: ${load.baskets.count}',
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Peso de referencia: ${load.baskets.realWeight.toStringAsFixed(2)} kg',
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Peso gavera: ${load.baskets.referenceWeight} g',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Nuevo cargue'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Stage2LoadForm(isNew: true, project: project),
            ),
          );
        },
      ),
    );
  }
}
