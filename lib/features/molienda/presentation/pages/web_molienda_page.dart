import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/auth/domain/enums/user_role.dart';
import 'package:registro_panela/features/auth/presentation/providers/auth_provider.dart';
import 'package:registro_panela/features/molienda/domain/entities/molienda.dart';
import 'package:registro_panela/features/molienda/presentation/providers/molienda_providers.dart';
import 'package:registro_panela/core/theme/utils/tokens.dart';
import 'package:registro_panela/shared/widgets/widgets.dart';
import 'package:registro_panela/core/services/custom_snack_bar.dart';
import '../../../shared/web_layout.dart';
import 'molienda_entregas_list.dart';
import 'molienda_form_dialog.dart';

final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
const Color _dividerColor = Color(0x2D7B4E1A);

class WebMoliendaPage extends ConsumerWidget {
  const WebMoliendaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(moliendaFormProvider, (_, next) {
      if (next.status == MoliendaFormStatus.success) {
        CustomSnackBar.show(
          context,
          message: 'Guardado correctamente',
          status: SnackbarStatus.accepted,
        );
      } else if (next.status == MoliendaFormStatus.error) {
        CustomSnackBar.show(
          context,
          message: 'Error al guardar',
          status: SnackbarStatus.error,
        );
      }
    });

    final itemsAsync = ref.watch(moliendaItemsProvider);
    final isAdmin = ref.watch(authProvider).user?.role == UserRole.admin;
    final textTheme = TextTheme.of(context);

    return WebLayout(
      selectedIndex: 3,
      onDestinationSelected: (index) {
        if (index == 0) context.go(Routes.projects);
        if (index == 1) context.push(Routes.inventory);
        if (index == 2) context.pushNamed('adminResetPassword');
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
                const Icon(
                  Icons.store_outlined,
                  color: AppColors.accentLightPanela,
                ),
                const SizedBox(width: AppSpacing.xSmall),
                Text(
                  'Moliendas'.toUpperCase(),
                  style: textTheme.headlineMedium?.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _showFormDialog(context, ref),
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.cardBackground,
                    size: 18,
                  ),
                  label: Text(
                    'Agregar',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.cardBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Contenido ─────────────────────────────────────────
          Expanded(
            child: itemsAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryPanelaBrown,
                ),
              ),
              error: (e, _) => ErrorWidgetCustom(error: e.toString()),
              data: (moliendas) => moliendas.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(AppSpacing.medium),
                      child: EmptyWidget(
                        message: 'Todavía no has creado ninguna molienda.',
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(AppSpacing.medium),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 380,
                            mainAxisSpacing: AppSpacing.medium,
                            crossAxisSpacing: AppSpacing.medium,
                            mainAxisExtent: 200,
                          ),
                      itemCount: moliendas.length,
                      itemBuilder: (_, index) {
                        final m = moliendas[index];
                        return _MoliendaCard(
                          key: ValueKey(m.id),
                          molienda: m,
                          onVerEntregas: () => _showEntregasDialog(context, m),
                          onEdit: () =>
                              _showFormDialog(context, ref, molienda: m),
                          onDelete: isAdmin
                              ? () => _confirmDelete(context, ref, m.id)
                              : null,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFormDialog(
    BuildContext context,
    WidgetRef ref, {
    Molienda? molienda,
  }) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.cardBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.large),
          ),
        ),
        builder: (ctx) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(ctx).bottom),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: MoliendaFormDialog(
              molienda: molienda,
              isNew: molienda == null,
            ),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.medium),
              child: MoliendaFormDialog(
                molienda: molienda,
                isNew: molienda == null,
              ),
            ),
          ),
        ),
      );
    }
  }

  void _showEntregasDialog(BuildContext context, Molienda molienda) {
    final textTheme = TextTheme.of(context);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.large),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 480),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Entregas de ${molienda.nombre}',
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.small),
                Expanded(child: MoliendaEntregasList(moliendaId: molienda.id)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final textTheme = TextTheme.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: Text('¿Eliminar molienda?', style: textTheme.headlineLarge),
        content: Text(
          'Esta acción no se puede deshacer.',
          style: textTheme.bodyLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('Cancelar', style: textTheme.bodyLarge),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(moliendaFormProvider.notifier).delete(id);
    }
  }
}

// ─── Tarjeta de molienda ──────────────────────────────────────────────────────

class _MoliendaCard extends StatelessWidget {
  final Molienda molienda;
  final VoidCallback onVerEntregas;
  final VoidCallback onEdit;
  final VoidCallback? onDelete;

  const _MoliendaCard({
    super.key,
    required this.molienda,
    required this.onVerEntregas,
    required this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.small,
              right: AppSpacing.small,
              top: AppSpacing.xSmall,
            ),
            child: Row(
              children: [
                const IconDecoration(
                  icon: Icons.storefront_outlined,
                  iconColor: AppColors.primaryPanelaBrown,
                ),
                const SizedBox(width: AppSpacing.xSmall),
                Expanded(
                  child: Text(
                    molienda.nombre,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.secondaryDarkPanela,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.local_shipping_outlined,
                    color: AppColors.weight,
                    size: 20,
                  ),
                  tooltip: 'Ver entregas',
                  onPressed: onVerEntregas,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.primaryPanelaBrown,
                    size: 20,
                  ),
                  tooltip: 'Editar',
                  onPressed: onEdit,
                ),
                if (onDelete != null)
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.error,
                      size: 20,
                    ),
                    tooltip: 'Eliminar',
                    onPressed: onDelete,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.small,
              vertical: AppSpacing.xSmall,
            ),
            child: const Divider(
              height: 1,
              thickness: 1,
              color: _dividerColor,
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
                  icon: Icons.phone,
                  iconColor: AppColors.weight,
                  firstText: 'Teléfono: ',
                  secondText: molienda.telefono,
                ),
                const SizedBox(height: AppSpacing.xSmall),
                CustomRichText(
                  icon: Icons.calendar_month,
                  iconColor: AppColors.secondaryDarkPanela,
                  firstText: 'Creada: ',
                  secondText: _dateFormat.format(molienda.creadoEn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
