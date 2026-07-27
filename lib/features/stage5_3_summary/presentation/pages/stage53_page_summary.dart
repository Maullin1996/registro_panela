import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:registro_panela/features/stage5_2_records/presentation/providers/sync_stage52_loads_provider.dart';
import 'package:registro_panela/core/theme/utils/tokens.dart';
import 'package:registro_panela/shared/widgets/widgets.dart';

class Stage53PageSummary extends ConsumerWidget {
  final String projectId;
  final String recordId;
  const Stage53PageSummary({
    super.key,
    required this.projectId,
    required this.recordId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final record = ref
        .watch(syncStage52LoadsProvider)
        .firstWhereOrNull((r) => r.id == recordId);

    if (record == null) {
      return const Scaffold(
        body: Center(child: Text('Registro no encontrado')),
      );
    }

    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: IconDecoration(
              icon: Icons.arrow_back_ios_new,
              iconColor: AppColors.secondaryDarkPanela,
            ),
          ),
        ),
        title: Text('Detalle del registro', style: textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.small,
          AppSpacing.large,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (record.photoPath.isNotEmpty)
              StageImageWidget(imageUrl: record.photoPath, fit: BoxFit.cover),
            const SizedBox(height: AppSpacing.smallLarge),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.small,
                      right: AppSpacing.small,
                      top: AppSpacing.xSmall,
                    ),
                    child: Text(
                      DateFormat.yMd().format(record.date),
                      style: textTheme.headlineMedium?.copyWith(
                        color: AppColors.primaryPanelaBrown,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.small,
                      vertical: AppSpacing.xSmall,
                    ),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.secondaryDarkPanela.withAlpha(45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.small,
                      right: AppSpacing.small,
                      bottom: AppSpacing.small,
                    ),
                    child: Column(
                      children: [
                        CustomRichText(
                          icon: Icons.storage_outlined,
                          iconColor: AppColors.weight,
                          firstText: 'Gavera usada: ',
                          secondText: '${record.gaveraWeight} g',
                        ),
                        const SizedBox(height: AppSpacing.small),
                        CustomRichText(
                          icon: Icons.scale,
                          iconColor: AppColors.weight,
                          firstText: 'Peso panela: ',
                          secondText:
                              '${record.panelaWeight.toStringAsFixed(2)} kg',
                        ),
                        const SizedBox(height: AppSpacing.small),
                        CustomRichText(
                          icon: Icons.unarchive_outlined,
                          firstText: 'Unidades  de panela: ',
                          secondText: record.unitCount.toString(),
                        ),
                        const SizedBox(height: AppSpacing.small),
                        CustomRichText(
                          icon: Icons.verified,
                          iconColor: AppColors.accepted,
                          firstText: 'Calidad: ',
                          secondText: record.quality.name.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
