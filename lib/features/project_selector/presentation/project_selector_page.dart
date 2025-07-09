import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/features/project_selector/providers/project_provider.dart';

class ProjectSelectorPage extends ConsumerWidget {
  const ProjectSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Selecionar Proyecto')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            child: ListTile(
              title: Text(project.name),
              subtitle: Text(project.description),
              onTap: () => context.go('/stage1?projectId=${project.id}'),
            ),
          );
        },
      ),
    );
  }
}
