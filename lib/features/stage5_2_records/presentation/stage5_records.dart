import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage5_2_records/providers/stage52_load_provider.dart';

class Stage52Page extends ConsumerWidget {
  final String projectId;
  const Stage52Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref
        .watch(stage52LoadProvider)
        .where((r) => r.projectId == projectId)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Registros de Panela')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: records.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final r = records[i];
          return ListTile(
            leading: r.photoPath.isNotEmpty
                ? Image.file(File(r.photoPath), width: 50, height: 50)
                : null,
            title: Text(
              '${r.unitCount} unidades – ${r.panelaWeight.toStringAsFixed(2)} kg',
            ),
            subtitle: Text(
              'Gavera: ${r.gaveraWeight.toStringAsFixed(0)}g • ${r.quality.name.toUpperCase()}',
            ),
            onTap: () {
              context.push(
                '${Routes.stage5}/'
                '$projectId/records/${r.id}/summary',
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Nuevo registro'),
        onPressed: () {
          context.push('${Routes.stage5}/$projectId/records/form');
        },
      ),
    );
  }
}
