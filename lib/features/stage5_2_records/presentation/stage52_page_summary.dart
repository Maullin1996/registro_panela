import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_panela/features/stage5_2_records/providers/stage52_load_provider.dart';

class Stage52SummaryPage extends ConsumerWidget {
  final String projectId;
  final String recordId;
  const Stage52SummaryPage({
    super.key,
    required this.projectId,
    required this.recordId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref
        .watch(stage52LoadProvider)
        .firstWhere((r) => r.id == recordId);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (record.photoPath.isNotEmpty) Image.file(File(record.photoPath)),
            const SizedBox(height: 16),
            Text('Fecha: ${DateFormat.yMd().format(record.date)}'),
            const SizedBox(height: 8),
            Text('Gavera usada: ${record.gaveraWeight} g'),
            const SizedBox(height: 8),
            Text('Peso panela: ${record.panelaWeight.toStringAsFixed(2)} kg'),
            const SizedBox(height: 8),
            Text('Unidades: ${record.unitCount}'),
            const SizedBox(height: 8),
            Text('Calidad: ${record.quality.name.toUpperCase()}'),
          ],
        ),
      ),
    );
  }
}
