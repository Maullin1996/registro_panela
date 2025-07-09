import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/widgets/stage1_form.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';

class Stage1Page extends ConsumerWidget {
  const Stage1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectId = GoRouterState.of(
      context,
    ).uri.queryParameters['projectId'];

    final projects = ref.watch(stage1ProjectsProvider);
    final project = projects.where((p) => p.id == projectId).isNotEmpty
        ? projects.firstWhere((p) => p.id == projectId)
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(project == null ? 'New Project' : 'Edit Project'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go(Routes.projects),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Stage1Form(initialData: project),
        ),
      ),
    );
  }
}
