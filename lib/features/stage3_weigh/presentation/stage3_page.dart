import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/domain/stage1_form_data.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage2_load/domain/stage2_load_data.dart';
import 'package:registro_panela/features/stage2_load/providers/stage2_load_provider.dart';
import 'package:registro_panela/features/stage3_weigh/domain/stage3_form_data.dart';
import 'package:registro_panela/features/stage3_weigh/providers/stage3_load_provider.dart';

import '../../../shared/utils/colors.dart';

class Stage3Page extends ConsumerWidget {
  final String projectId;
  const Stage3Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhereOrNull((p) => p.id == projectId);
    final loads2 = ref
        .watch(stage2LoadProvider)
        .where((l) => l.projectId == projectId)
        .toList();

    final entries3 = ref.watch(stage3LoadProvider);

    if (project == null) {
      return const Scaffold(
        body: Center(child: Text('Proyecto no encontrado')),
      );
    }

    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesaje: ${project.name}', style: textTheme.headlineMedium),
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: loads2.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
        itemBuilder: (BuildContext context, int index) {
          double sum = 0.0;
          final load2 = loads2[index];
          final group = load2.baskets;
          final totalBaskets = group.count;
          final realWeight = group.realWeight;
          final totalRefkg = totalBaskets * realWeight;

          final entry = entries3.firstWhereOrNull(
            (e) => e.stage2LoadId == load2.id,
          );
          if (entry != null) {
            for (var element in entry.baskets) {
              sum += element.realWeight;
            }
          }
          final regCount = entry?.baskets.length ?? 0;
          final regWeight = sum;
          final missingCount = totalBaskets - regCount;
          final missingWeight = totalRefkg - regWeight;

          return GestureDetector(
            onTap: () => _onLoadTap(context, project, load2, entry),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
                side: BorderSide(
                  color: AppColors.inputBorder, // Color del borde
                  width: 2, // Grosor del borde
                ),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha: ${DateFormat.yMd().format(load2.date)}',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Registrado en Mlienda',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Canastillas enviadas: $totalBaskets',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso canastilla: ${group.realWeight.toStringAsFixed(2)} kg',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso total esperado: ${totalRefkg.toStringAsFixed(2)} kg',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Registrado en bodega',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Canastillas registradas: $regCount',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso total registrado: ${regWeight.toStringAsFixed(2)} kg',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Canastillas y Peso faltante',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Faltan canastillas: $missingCount',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso faltante: ${missingWeight.toStringAsFixed(2)}kg',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onLoadTap(
    BuildContext context,
    Stage1FormData project,
    Stage2LoadData load2,
    Stage3FormData? entry,
  ) {
    final textTheme = TextTheme.of(context);
    showDialog(
      context: context,
      builder: (dcontext) => AlertDialog(
        title: Text('¿Qué deseas hacer?', style: textTheme.headlineMedium),
        actions: [
          if (entry != null)
            TextButton(
              onPressed: () {
                context.pop(dcontext);
                context.push(
                  '${Routes.stage3}/${project.id}/${load2.id}/summary',
                );
              },
              child: Text('Ver resumen', style: textTheme.bodyLarge),
            ),
          TextButton(
            onPressed: () {
              context.pop(dcontext);
              context.push('${Routes.stage3}/$projectId/${load2.id}/form');
            },
            child: Text('Continuar formulario', style: textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
