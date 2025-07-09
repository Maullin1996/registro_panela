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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if ((user != null &&
              (user.role == UserRole.admin || user.role == UserRole.stage1))) {
            context.go(Routes.stage1);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Solo el administrador puede crear nuevos proyectos.',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Icon(Icons.add_outlined),
      ),
      appBar: AppBar(title: const Text('Selecionar Proyecto')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            child: ListTile(
              title: Text(project.name),
              subtitle: Text(
                'Gaveras: ${project.gaveras.length}, Canastillas: ${project.basketsQuantity}',
              ),
              onTap: () => context.go('/stage2?projectId=${project.id}'),
            ),
          );
        },
      ),
    );
  }
}
