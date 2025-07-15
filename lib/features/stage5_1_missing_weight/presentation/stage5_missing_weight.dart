import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/providers/global_missing_provider.dart';

class Stage5MissingWeight extends ConsumerWidget {
  final String projectId;
  const Stage5MissingWeight({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary3 = ref.watch(stage3GlobalSummaryProvider(projectId));
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Resumen de peso faltante',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text('Canastillas esperadas: ${summary3.totalExpectedCount}'),
          Text(
            'Peso esperado: ${summary3.totalExpectedWeight.toStringAsFixed(2)} kg',
          ),
          const SizedBox(height: 8),
          Text('Canastillas registradas: ${summary3.totalRegisteredCount}'),
          Text(
            'Peso registrado: ${summary3.totalRegisteredWeight.toStringAsFixed(2)} kg',
          ),
          const Divider(height: 32),
          Text(
            'Faltantes: ${summary3.totalMissingCount} canastillas '
            '(${summary3.totalMissingWeight.toStringAsFixed(2)} kg)',
            style: TextStyle(color: Colors.red[700]),
          ),
        ],
      ),
    );
  }
}
