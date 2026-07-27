import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/auth/presentation/providers/providers.dart';
import 'package:registro_panela/features/admin/presentation/providers/admin_provider.dart';
import 'package:registro_panela/core/theme/utils/tokens.dart';
import '../../../shared/web_layout.dart';
import 'admin_reset_password_form.dart';

class WebAdministrativePage extends ConsumerWidget {
  const WebAdministrativePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final isAdmin = auth.user?.role.name == 'admin';
    final textTheme = TextTheme.of(context);

    if (!isAdmin) {
      return const Scaffold(
        body: Center(
          child: Text('Solo administradores pueden acceder a esta pantalla'),
        ),
      );
    }

    return WebLayout(
      selectedIndex: 2,
      onDestinationSelected: (index) {
        if (index == 0) context.go(Routes.projects);
        if (index == 1) context.push(Routes.inventory);
        if (index == 3) context.push(Routes.moliendas);
      },
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
                Icon(
                  Icons.admin_panel_settings_outlined,
                  color: AppColors.accentLightPanela,
                ),
                const SizedBox(width: AppSpacing.xSmall),
                Text(
                  'Cambiar contraseña'.toUpperCase(),
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () =>
                      ref.read(adminUsersControllerProvider.notifier).refresh(),
                  icon: const Icon(Icons.refresh),
                  color: AppColors.accentLightPanela,
                  tooltip: 'Recargar usuarios',
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
                  child: const AdminResetPasswordForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
