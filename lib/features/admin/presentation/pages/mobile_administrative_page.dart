import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:registro_panela/features/auth/presentation/providers/providers.dart';
import 'package:registro_panela/features/admin/presentation/providers/admin_provider.dart';
import 'package:registro_panela/core/theme/utils/colors.dart';
import 'package:registro_panela/core/theme/utils/spacing.dart';
import 'package:registro_panela/shared/widgets/widgets.dart';

import 'admin_reset_password_form.dart';

class MobileAdministrativePage extends ConsumerWidget {
  const MobileAdministrativePage({super.key});

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cambiar contraseña'.toUpperCase(),
            style: textTheme.headlineLarge,
          ),
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
          actions: [
            IconButton(
              onPressed: () =>
                  ref.read(adminUsersControllerProvider.notifier).refresh(),
              icon: const Icon(Icons.refresh),
              tooltip: 'Recargar usuarios',
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: AppSpacing.small,
                right: AppSpacing.small,
                top: AppSpacing.small,
                bottom: AppSpacing.medium,
              ),
              child: const AdminResetPasswordForm(),
            ),
          ),
        ),
      ),
    );
  }
}
