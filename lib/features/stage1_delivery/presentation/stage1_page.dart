import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/features/project_selector/domin/project.dart';
import 'package:registro_panela/features/project_selector/providers/project_provider.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/widgets/stage1_form.dart';

class Stage1Page extends ConsumerWidget {
  const Stage1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final projectId = GoRouterState.of(
      context,
    ).uri.queryParameters['projectId'];

    final projects = ref.watch(projectListProvider);
    final Project? project = projects.where((p) => p.id == projectId).isNotEmpty
        ? projects.firstWhere((p) => p.id == projectId)
        : null;
    return Scaffold(
      appBar: AppBar(title: const Text('Etapa 1: Entrega')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: project == null
              ? const Center(child: Text('Proyecto no Encontrado'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Proyecto seleccionado', style: textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(project.name, style: textTheme.headlineSmall),
                    const SizedBox(height: 16),
                    const Stage1Form(),
                  ],
                ),
        ),
      ),
    );
  }
}
