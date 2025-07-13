import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_load_provider.dart';
import 'package:registro_panela/features/stage3_weigh/providers/stage3_load_provider.dart';

class Stage3PageSummary extends ConsumerWidget {
  final String projectId;
  final String load2Id;
  const Stage3PageSummary({
    super.key,
    required this.projectId,
    required this.load2Id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref
        .watch(stage1ProjectsProvider)
        .where((p) => p.id == projectId)
        .first;
    final load2 = ref
        .watch(stage2LoadProvider)
        .where((l) => l.projectId == projectId)
        .first;
    final entry3 = ref
        .watch(stage3LoadProvider)
        .where((p) => p.projectId == project.id)
        .first;

    // 2) Cálculos de totales
    final group = load2.baskets;
    final totalBaskets = group.count;
    final totalRefKg = group.referenceWeight * totalBaskets;

    final regCount =
        entry3.baskets.length; // cada elemento es una canastilla registrada
    final regWeight = entry3.baskets.fold<double>(
      0,
      (sum, b) => sum + b.realWeight,
    );

    final missingCount = totalBaskets - regCount;
    final missingWeight = totalRefKg - regWeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen pesaje'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Molienda: ${project.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            Text(
              'Fecha cargue: ${DateFormat.yMd().format(load2.date)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Totales esperados vs registrados
            Text('Peso esperado: ${totalRefKg.toStringAsFixed(2)} kg'),
            const SizedBox(height: 8),
            Text('Canastillas registradas: $regCount'),
            const SizedBox(height: 8),
            Text('Peso registrado: ${regWeight.toStringAsFixed(2)} kg'),
            const SizedBox(height: 8),
            Text('Faltan canastillas: $missingCount'),
            const SizedBox(height: 8),
            Text('Peso faltante: ${missingWeight.toStringAsFixed(2)} kg'),
            const Divider(height: 32),

            Center(
              child: Text(
                'Detalle por canastilla',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 16),

            // Listado de cada canastilla
            ...entry3.baskets.map((b) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Canastilla #${b.sequence + 1}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Peso registrado: ${b.realWeight.toStringAsFixed(2)} kg',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Peso faltante: ${(load2.baskets.realWeight - b.realWeight).toStringAsFixed(2)} kg',
                      ),
                      const SizedBox(height: 4),
                      Text('Calidad: ${b.quality.name.toUpperCase()}'),
                      const SizedBox(height: 8),
                      if (b.photoPath.isNotEmpty)
                        Image.file(
                          File(b.photoPath),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
