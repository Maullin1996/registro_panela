import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/project_selector/domin/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_provider.g.dart';

@riverpod
List<Project> projectList(Ref ref) {
  return [
    const Project(
      id: '1',
      name: 'Molienda Lote A',
      description: 'Proyecto de prueba A',
    ),
    const Project(
      id: '2',
      name: 'Molienda Lote B',
      description: 'Proyecto de prueba B',
    ),
    const Project(
      id: '3',
      name: 'Molienda Especial',
      description: 'Proyecto especial',
    ),
  ];
}
