import 'package:flutter/material.dart';

class ProjectSelectorPage extends StatelessWidget {
  const ProjectSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selector de Proyecto')),
      body: Center(child: Text('Aquí se listarán los proyectos disponibles.')),
    );
  }
}
