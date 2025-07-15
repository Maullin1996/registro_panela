import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/presentation/stage5_missing_weight.dart';
import 'package:registro_panela/features/stage5_2_records/presentation/stage5_records.dart';
import 'package:registro_panela/features/stage5_summary/presentation/stage5_summary.dart';

class Stage5Page extends ConsumerStatefulWidget {
  final String projectId;
  const Stage5Page({super.key, required this.projectId});

  @override
  ConsumerState<Stage5Page> createState() => _Stage5PageState();
}

class _Stage5PageState extends ConsumerState<Stage5Page> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhere((p) => p.id == widget.projectId);

    final screens = [
      Stage5Summary(projectId: widget.projectId),
      Stage5MissingWeight(projectId: widget.projectId),
      Stage5Records(projectId: widget.projectId),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
        leading: BackButton(onPressed: () => context.go(Routes.projects)),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) => setState(() => selectedIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Resumen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page_outlined),
            label: 'Reporte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_add),
            label: 'Entrega',
          ),
        ],
      ),
    );
  }
}
