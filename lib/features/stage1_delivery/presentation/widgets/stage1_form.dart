import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/services/image_picker_service_provider.dart';
import 'package:registro_panela/features/auth/domin/authenticated_user.dart';
import 'package:registro_panela/features/auth/providers/auth_provider.dart';
import 'package:registro_panela/features/stage1_delivery/domin/gavera_data.dart';
import 'package:registro_panela/features/stage1_delivery/domin/stage1_form_data.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/widgets/app_form_text_fild.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_form_provider.dart';

class Stage1Form extends ConsumerStatefulWidget {
  const Stage1Form({super.key});

  @override
  ConsumerState<Stage1Form> createState() => _Stage1FormState();
}

class _Stage1FormState extends ConsumerState<Stage1Form> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<int> _gaveras = [0];
  String? _fotoPath;

  void _addGavera() {
    setState(() {
      _gaveras.add(_gaveras.length);
    });
  }

  void _removeGavera(int index) {
    setState(() {
      _gaveras.remove(index);
    });
  }

  Future<void> _onPickImage() async {
    final imagePickerService = ref.read(imagePickerServiceProvider);
    final pickedPath = await imagePickerService.pickImage(fromCamera: true);
    if (pickedPath != null) {
      setState(() {
        _fotoPath = pickedPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stage1FormProvider);
    final user = ref.read(authProvider).user;
    return Column(
      children: [
        if (state.status == Stage1FormStatus.error)
          Column(
            children: [
              Text(
                state.errorMessage ?? 'Error al guardar',
                style: const TextStyle(color: Colors.red),
              ),
              SizedBox(height: 16),
            ],
          ),
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              AppFormTextFild(
                name: 'nombre',
                label: 'Nombre molienda',
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Gaveras',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    onPressed: _addGavera,
                    tooltip: 'Agregar otra gavera',
                  ),
                ],
              ),
              ..._gaveras.map(
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppFormTextFild(
                          name: 'gaverasCantidad_$index',
                          label: 'Cantidad (Gavera ${index + 1})',
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.integer(),
                            FormBuilderValidators.min(1),
                          ]),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppFormTextFild(
                          name: 'gaverasPeso_$index',
                          label: 'Peso referencia (g)',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.min(1),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      if (_gaveras.length > 1)
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onPressed: () => _removeGavera(index),
                          tooltip: 'Eliminar esta gavera',
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AppFormTextFild(
                      name: 'canastillaCantidad',
                      label: 'Cantidad canastillas',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.integer(),
                        FormBuilderValidators.min(1),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TwoFormsRow(
                nameFirst: 'conservantesPeso',
                labeFirst: 'Conservantes (kg)',
                labeSecond: 'Tarros de conservantes',
                nameSecond: 'conservantesTarros',
              ),
              const SizedBox(height: 16),
              TwoFormsRow(
                nameFirst: 'calPeso',
                labeFirst: 'Cal (kg)',
                labeSecond: 'Tarros de cal',
                nameSecond: 'calTarros',
              ),
              const SizedBox(height: 16),
              AppFormTextFild(
                name: 'telefono',
                label: 'Teléfono',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(10),
                  FormBuilderValidators.minLength(10),
                ]),
                keyboardType: TextInputType.phone,
              ),
              FormBuilderDateTimePicker(
                name: 'fecha',
                decoration: const InputDecoration(labelText: 'Fecha'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _onPickImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Tomar Foto'),
                  ),
                  const SizedBox(width: 10),
                  if (_fotoPath != null)
                    Expanded(
                      child: Image.file(
                        File(_fotoPath!),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.status == Stage1FormStatus.submitting
                    ? null
                    : () {
                        final isValid =
                            _formKey.currentState?.saveAndValidate() ?? false;
                        if (!isValid) return;
                        final values = _formKey.currentState!.value;
                        final gaveras = <GaveraData>[];
                        for (int i = 0; i < _gaveras.length; i++) {
                          final cantidad =
                              int.tryParse(
                                values['gaverasCantidad_$i'] ?? '',
                              ) ??
                              0;
                          final peso =
                              double.tryParse(values['gaverasPeso_$i'] ?? '') ??
                              0.0;
                          gaveras.add(
                            GaveraData(
                              cantidad: cantidad,
                              pesoReferencia: peso,
                            ),
                          );
                        }
                        final data = Stage1FormData(
                          nombre: values['nombre'],
                          gaveras: gaveras,
                          canastillasCantidad: int.parse(
                            values['canastillaCantidad'] ?? 0,
                          ),
                          conservantesPeso: double.parse(
                            values['conservantesPeso'] ?? 0.0,
                          ),
                          conservantesTarros: int.parse(
                            values['conservantesTarros'] ?? 0,
                          ),
                          calPeso: double.parse(values['calPeso'] ?? 0),
                          calTarros: int.parse(values['calTarros'] ?? 0),
                          telefono: values['telefono'],
                          fecha: values['fecha'],
                          fotoPath: _fotoPath,
                        );
                        ref.read(stage1FormProvider.notifier).submit(data);
                        if (user?.role != UserRole.admin) {
                          _formKey.currentState?.reset();
                          setState(() {
                            _gaveras.clear();
                            _gaveras.add(0);
                            _fotoPath = null;
                          });
                        }
                        if (user?.role == UserRole.admin) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                '¡Datos guardados! Como admin, puedes revisar otras etapas.',
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                '¡Datos guardados!',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          );
                          Future.delayed(const Duration(milliseconds: 600), () {
                            if (mounted) context.go('/projects');
                          });
                        }
                      },
                child: state.status == Stage1FormStatus.submitting
                    ? const CircularProgressIndicator()
                    : const Text('Guardar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TwoFormsRow extends StatelessWidget {
  final String nameFirst;
  final String labeFirst;
  final String nameSecond;
  final String labeSecond;

  const TwoFormsRow({
    super.key,
    required this.nameFirst,
    required this.labeFirst,
    required this.nameSecond,
    required this.labeSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppFormTextFild(
            name: nameFirst,
            label: labeFirst,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.min(0),
            ]),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppFormTextFild(
            name: nameSecond,
            label: labeSecond,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.min(0),
            ]),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
