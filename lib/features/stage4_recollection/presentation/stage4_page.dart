import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_load_provider.dart';

class Stage4Page extends ConsumerWidget {
  final String projectId;
  const Stage4Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhere((p) => p.id == projectId);

    final returns = ref
        .watch(stage4LoadProvider)
        .where((r) => r.projectId == projectId)
        .toList();

    // totales de Stage1
    final totalBaskets = project.basketsQuantity;
    final totalPreserveJars = project.preservativesJars;
    final totalLimeJars = project.limeJars;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Devoluciones'),
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: returns.length,
        itemBuilder: (ctx, i) {
          final r = returns[i];
          return GestureDetector(
            onTap: () =>
                context.push('${Routes.stage4}/$projectId/${r.id}/edit'),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fecha: ${DateFormat.yMMMd().format(r.date)}'),
                    const SizedBox(height: 8),

                    // Gaveras devueltas / faltantes
                    ...List.generate(project.gaveras.length, (idx) {
                      final orig = project.gaveras[idx];
                      final ret = r.returnedGaveras[idx];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gaveras ${orig.referenceWeight}g devueltas: ${ret.quantity}',
                          ),
                          Text('Faltaron: ${orig.quantity - ret.quantity}'),
                          const SizedBox(height: 8),
                        ],
                      );
                    }),

                    // Canastillas
                    Text('Canastillas devueltas: ${r.returnedBaskets}'),
                    Text('Faltaron: ${totalBaskets - r.returnedBaskets}'),
                    const SizedBox(height: 8),

                    // Tarros conservantes
                    Text(
                      'Tarros conservantes devueltos: ${r.returnedPreservativesJars}',
                    ),
                    Text(
                      'Faltaron: ${totalPreserveJars - r.returnedPreservativesJars}',
                    ),
                    const SizedBox(height: 8),

                    // Tarros cal
                    Text('Tarros cal devueltos: ${r.returnedLimeJars}'),
                    Text('Faltaron: ${totalLimeJars - r.returnedLimeJars}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Registrar devolución'),
        onPressed: () => context.push('${Routes.stage4}/$projectId/new'),
      ),
    );
  }
}
