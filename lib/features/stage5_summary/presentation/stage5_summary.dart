import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/features/stage5_summary/providers/stage5_global_summary_provider.dart';
import 'package:registro_panela/features/stage5_summary/providers/stage5_summary_provider.dart';

class Stage5Summary extends ConsumerWidget {
  final String projectId;
  const Stage5Summary({required this.projectId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryByDay = ref.watch(stage5SummaryProvider(projectId));
    final globalSummary = ref.watch(stage5GlobalSummaryProvider(projectId));

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen de cargues')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // POR DÍA
            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // habilita scroll si se sale de pantalla
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Fecha')),
                  DataColumn(label: Text('Canastillas')),
                  DataColumn(label: Text('Peso real (kg)')),
                  DataColumn(label: Text('Gavera (g)')),
                ],
                rows: summaryByDay.expand((day) {
                  final fecha = DateFormat.yMd().format(day.date);
                  return day.items.map((it) {
                    return DataRow(
                      cells: [
                        DataCell(Text(fecha)),
                        DataCell(Text('${it.totalCount}')),
                        DataCell(Text(it.realWeight.toStringAsFixed(0))),
                        DataCell(Text(it.gaveraWeight.toStringAsFixed(0))),
                      ],
                    );
                  });
                }).toList(),
              ),
            ),

            // TOTAL GLOBAL
            const SizedBox(height: 16),
            Text(
              'Total canastillas',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            ...globalSummary.map((it) {
              return Text(
                '${it.totalCount} canastillas de ${it.realWeight.toStringAsFixed(0)} kg – gavera ${it.gaveraWeight.toStringAsFixed(0)}',
              );
            }),
          ],
        ),
      ),
    );
  }
}
