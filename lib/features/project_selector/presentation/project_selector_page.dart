import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/auth/domin/authenticated_user.dart';
import 'package:registro_panela/features/auth/providers/auth_provider.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';

class ProjectSelectorPage extends ConsumerWidget {
  const ProjectSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(stage1ProjectsProvider);
    final user = ref.watch(authProvider).user;

    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Proyecto')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Sólo admin y stage1 pueden crear
          if (user != null &&
              (user.role == UserRole.admin || user.role == UserRole.stage1)) {
            context.go('${Routes.stage1}/new');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sólo admin o Stage1 pueden crear proyectos'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: const Icon(Icons.add_outlined),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, i) {
          final p = projects[i];
          return Card(
            child: ListTile(
              title: Text(p.name),
              subtitle: Text(
                'Gaveras: ${p.gaveras.length}, Canastillas: ${p.basketsQuantity}',
              ),
              onTap: () {
                if (user?.role == UserRole.admin) {
                  _showAdminStageSelector(context, p.id);
                } else {
                  final route = _routeForRole(user!.role);
                  context.go('$route/${p.id}');
                }
              },
            ),
          );
        },
      ),
    );
  }

  String _routeForRole(UserRole role) {
    switch (role) {
      case UserRole.stage1:
        return Routes.stage1;
      case UserRole.stage2:
        return Routes.stage2;
      case UserRole.stage3:
        return Routes.stage3;
      case UserRole.stage4:
        return Routes.stage4;
      case UserRole.stage5:
        return Routes.stage5;
      default:
        return Routes.projects;
    }
  }

  void _showAdminStageSelector(BuildContext context, String projectId) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var stage = 1; stage <= 5; stage++)
              ListTile(
                leading: Icon(_iconForStage(stage)),
                title: Text('Etapa $stage'),
                onTap: () => context.go('${byStage(stage)}/$projectId'),
              ),
          ],
        ),
      ),
    );
  }

  IconData _iconForStage(int stage) {
    switch (stage) {
      case 1:
        return Icons.delivery_dining;
      case 2:
        return Icons.inbox_outlined;
      case 3:
        return Icons.scale;
      case 4:
        return Icons.assignment_return;
      case 5:
        return Icons.summarize_outlined;
      default:
        return Icons.help;
    }
  }
}

String byStage(int n) {
  switch (n) {
    case 1:
      return Routes.stage1;
    case 2:
      return Routes.stage2;
    case 3:
      return Routes.stage3;
    case 4:
      return Routes.stage4;
    case 5:
      return Routes.stage5;
    default:
      return Routes.projects;
  }
}
