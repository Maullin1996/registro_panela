import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:registro_panela/core/services/custom_snack_bar.dart';
import 'package:registro_panela/core/theme/utils/colors.dart';
import 'package:registro_panela/core/theme/utils/radius.dart';
import 'package:registro_panela/core/theme/utils/spacing.dart';
import 'package:registro_panela/features/shared/web_layout.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/pages/stage1_load_form.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/providers/index.dart';
import 'package:registro_panela/shared/widgets/icon_decoration.dart';

class WebStage1Page extends ConsumerWidget {
  final String projectId;
  const WebStage1Page({required this.projectId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);

    ref.listen<Stage1FormState>(stage1FormProvider, (prev, next) {
      if (prev?.status == Stage1FormStatus.submitting &&
          next.status == Stage1FormStatus.success) {
        CustomSnackBar.show(
          context,
          message: 'Formulario subido correctamente',
          status: SnackbarStatus.accepted,
        );
        context.pop();
      }
      if (next.status == Stage1FormStatus.error) {
        CustomSnackBar.show(
          context,
          message: 'Error al subir el formulario',
          status: SnackbarStatus.error,
        );
      }
    });

    final isNew = projectId == 'new';
    final project = isNew
        ? null
        : ref.watch(stage1ProjectByIdProvider(projectId));

    if (!isNew && project == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return WebLayout(
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      child: Column(
        children: [
          // ── Header ────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.small,
              AppSpacing.small,
              AppSpacing.small,
              0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.small,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryDarkPanela,
              borderRadius: BorderRadius.circular(AppRadius.extraLarge),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textDark.withAlpha(20),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: IconDecoration(
                      icon: Icons.arrow_back_ios_new,
                      iconColor: AppColors.accentLightPanela,
                      backgroundColor: AppColors.backgroundCrema,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.xSmall),
                Text(
                  isNew
                      ? 'Nuevo proyecto'.toUpperCase()
                      : 'Modificar ${project!.name}'.toUpperCase(),
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          // ── Formulario centrado ────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.medium),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Stage1LoadForm(isNew: isNew, initialData: project),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
