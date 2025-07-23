import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage5_2_records/providers/stage52_load_provider.dart';
import 'package:registro_panela/shared/utils/tokens.dart';
import 'package:registro_panela/shared/widgets/custom_card.dart';
import 'package:registro_panela/shared/widgets/custom_rich_text.dart';

class Stage52Page extends ConsumerWidget {
  final String projectId;
  const Stage52Page({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref
        .watch(stage52LoadProvider)
        .where((r) => r.projectId == projectId)
        .toList();

    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registros de Panela', style: textTheme.headlineMedium),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.large,
        ),
        itemCount: records.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.small),
        itemBuilder: (_, i) {
          final r = records[i];
          return CustomCard(
            child: ListTile(
              leading: r.photoPath.isNotEmpty
                  ? Image.file(File(r.photoPath), width: 80, height: 150)
                  : null,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    firstText: 'Unidades de panela: ',
                    secondText: r.unitCount.toString(),
                  ),
                  CustomRichText(
                    firstText: 'Peso paquete: ',
                    secondText: '${r.gaveraWeight.toStringAsFixed(0)}g',
                  ),
                  CustomRichText(
                    firstText: 'Gavera: ',
                    secondText: '${r.panelaWeight.toStringAsFixed(2)} kg',
                  ),
                  CustomRichText(
                    firstText: 'Calidad: ',
                    secondText: r.quality.name.toUpperCase(),
                  ),
                ],
              ),
              onTap: () {
                context.push(
                  '${Routes.stage5}/'
                  '$projectId/records/${r.id}/summary',
                );
              },
            ),
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
