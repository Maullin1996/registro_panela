import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:registro_panela/core/services/image_picker_service_provider.dart';
import 'package:registro_panela/features/stage1_delivery/domain/stage1_form_data.dart';
import 'package:registro_panela/shared/widgets/app_form_text_fild.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_form_provider.dart';
import 'package:uuid/uuid.dart';

class Stage1Form extends ConsumerStatefulWidget {
  final Stage1FormData? initialData;
  final bool isNew;
  const Stage1Form({required this.isNew, this.initialData, super.key});

  @override
  ConsumerState<Stage1Form> createState() => _Stage1FormState();
}

class _Stage1FormState extends ConsumerState<Stage1Form> {
  late final GlobalKey<FormBuilderState> _formKey;
  late final List<int> _gaveras;
  String? _fotoPath;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormBuilderState>();
    _gaveras = widget.initialData?.gaveras.asMap().keys.toList() ?? [0];
    _fotoPath = widget.initialData?.photoPath;
  }

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
    final initial = widget.initialData;

    final uuid = Uuid();

    final state = ref.watch(stage1FormProvider);

    final isNew = widget.isNew;

    final formNotifier = ref.read(stage1FormProvider.notifier);

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
          initialValue: initial == null
              ? {}
              : {
                  'name': initial.name,
                  'basketsQuantity': initial.basketsQuantity.toString(),
                  'preservativesWeight': initial.preservativesWeight.toString(),
                  'preservativesJars': initial.preservativesJars.toString(),
                  'limeWeight': initial.limeWeight.toString(),
                  'limeJars': initial.limeJars.toString(),
                  'phone': initial.phone,
                  ...{
                    for (int i = 0; i < initial.gaveras.length; i++)
                      'gaverasCantidad_$i': initial.gaveras[i].quantity
                          .toString(),
                    for (var i = 0; i < initial.gaveras.length; i++)
                      'gaverasPeso_$i': initial.gaveras[i].referenceWeight
                          .toString(),
                  },
                },
          child: Column(
            children: [
              AppFormTextFild(
                name: 'name',
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
                      name: 'basketsQuantity',
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
                nameFirst: 'preservativesWeight',
                labeFirst: 'Conservantes (kg)',
                labeSecond: 'Tarros de conservantes',
                nameSecond: 'preservativesJars',
              ),
              const SizedBox(height: 16),
              TwoFormsRow(
                nameFirst: 'limeWeight',
                labeFirst: 'Cal (kg)',
                labeSecond: 'Tarros de cal',
                nameSecond: 'limeJars',
              ),
              const SizedBox(height: 16),
              AppFormTextFild(
                name: 'phone',
                label: 'Teléfono',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(10),
                  FormBuilderValidators.minLength(10),
                ]),
                keyboardType: TextInputType.phone,
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
                    : () async {
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
                              quantity: cantidad,
                              referenceWeight: peso,
                            ),
                          );
                        }
                        final data = Stage1FormData(
                          id: widget.initialData?.id ?? uuid.v4(),
                          name: values['name'],
                          gaveras: gaveras,
                          basketsQuantity: int.parse(values['basketsQuantity']),
                          preservativesWeight: double.parse(
                            values['preservativesWeight'],
                          ),
                          preservativesJars: int.parse(
                            values['preservativesJars'],
                          ),
                          limeWeight: double.parse(values['limeWeight']),
                          limeJars: int.parse(values['limeJars']),
                          phone: values['phone'],
                          date: initial?.date ?? DateTime.now(),
                          photoPath: _fotoPath,
                        );
                        formNotifier.submit(data, isNew: isNew);
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
