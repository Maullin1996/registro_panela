import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:registro_panela/core/services/image_picker_service_provider.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_projects_provider.dart';
import 'package:registro_panela/features/stage5_2_records/domain/stage52_record_data.dart';
import 'package:registro_panela/features/stage5_2_records/providers/stage52_form_status.dart';
import 'package:registro_panela/shared/widgets/app_form_text_fild.dart';
import 'package:uuid/uuid.dart';

class Stage52FormPage extends ConsumerStatefulWidget {
  final String projectId;
  const Stage52FormPage({super.key, required this.projectId});

  @override
  ConsumerState<Stage52FormPage> createState() => _Stage52FormPageState();
}

class _Stage52FormPageState extends ConsumerState<Stage52FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    final project = ref
        .watch(stage1ProjectsProvider)
        .firstWhereOrNull((p) => p.id == widget.projectId)!;
    final formState = ref.watch(stage52FormProvider);
    final formNotifier = ref.read(stage52FormProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo registro de panela')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // 1) Selector de gaveraWeight
              FormBuilderDropdown<double>(
                name: 'gaveraw',
                decoration: const InputDecoration(labelText: 'Gavera'),
                items: project.gaveras
                    .map(
                      (g) => DropdownMenuItem(
                        value: g.referenceWeight,
                        child: Text('${g.referenceWeight} g'),
                      ),
                    )
                    .toList(),
                validator: FormBuilderValidators.required(),
              ),

              const SizedBox(height: 16),
              // 2) Peso de panela
              AppFormTextFild(
                name: 'panelaWeight',
                label: 'Peso de panela (kg)',
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),

              const SizedBox(height: 16),
              // 3) Unidades
              AppFormTextFild(
                name: 'unitCount',
                label: 'Unidades de panela',
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.integer(),
                ]),
              ),

              const SizedBox(height: 16),
              // 4) Calidad
              FormBuilderDropdown<String>(
                name: 'quality',
                decoration: const InputDecoration(labelText: 'Calidad'),
                items: BasketQuality.values
                    .map(
                      (q) => DropdownMenuItem(
                        value: q.name,
                        child: Text(q.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                validator: FormBuilderValidators.required(),
              ),

              const SizedBox(height: 16),
              // 5) Foto
              ElevatedButton.icon(
                onPressed: () async {
                  final path = await ref
                      .read(imagePickerServiceProvider)
                      .pickImage(fromCamera: true);
                  if (path != null) {
                    setState(() => _photoPath = path);
                  }
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Tomar foto'),
              ),
              if (_photoPath != null) ...[
                const SizedBox(height: 8),
                Image.file(File(_photoPath!), width: 100, height: 100),
              ],

              const SizedBox(height: 24),
              FloatingActionButton.extended(
                onPressed: formState.status == Stage52FormStatus.submitting
                    ? null
                    : () {
                        if (!(_formKey.currentState?.saveAndValidate() ??
                            false)) {
                          return;
                        }
                        final v = _formKey.currentState!.value;
                        final record = Stage52RecordData(
                          id: _uuid.v4(),
                          projectId: widget.projectId,
                          date: DateTime.now(),
                          gaveraWeight: v['gaveraw'] as double,
                          panelaWeight: double.parse(v['panelaWeight']),
                          unitCount: int.parse(v['unitCount']),
                          quality: BasketQuality.values.firstWhere(
                            (q) => q.name == v['quality'],
                          ),
                          photoPath: _photoPath ?? '',
                        );
                        formNotifier.submit(data: record);
                      },
                label: const Text('Guardar registro'),
              ),

              if (formState.status == Stage52FormStatus.error)
                Text('Error: ${formState.errorMessage}'),
            ],
          ),
        ),
      ),
    );
  }

  String? _photoPath;
}
