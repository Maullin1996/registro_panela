import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:registro_panela/features/stage1_delivery/providers/stage1_project_by_id_provider.dart';
import 'package:registro_panela/features/stage4_recollection/domin/stage4_form_data.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_form_provider.dart';
import 'package:registro_panela/shared/widgets/app_form_text_fild.dart';
import 'package:uuid/uuid.dart';

class Stage4LoadForm extends ConsumerStatefulWidget {
  final String projectId;
  final Stage4FormData? initialData;
  final bool isNew;
  const Stage4LoadForm({
    super.key,
    required this.projectId,
    this.initialData,
    required this.isNew,
  });

  @override
  ConsumerState<Stage4LoadForm> createState() => _Stage4LoadFormState();
}

class _Stage4LoadFormState extends ConsumerState<Stage4LoadForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(stage4FormProvider);

    final project = ref.watch(stage1ProjectByIdProvider(widget.projectId))!;

    final formNotifier = ref.read(stage4FormProvider.notifier);

    final uuid = const Uuid();

    final init = widget.initialData;

    final initialMap = <String, dynamic>{};
    if (init != null) {
      for (var i = 0; i < project.gaveras.length; i++) {
        initialMap['returnedGaveras_$i'] = init.returnedGaveras[i].quantity
            .toString();
      }
      initialMap['returnedBaskets'] = init.returnedBaskets.toString();
      initialMap['returnedPreservativesJars'] = init.returnedPreservativesJars
          .toString();
      initialMap['returnedLimeJars'] = init.returnedLimeJars.toString();
    }
    return FormBuilder(
      key: _formKey,
      initialValue: initialMap,
      child: Column(
        children: [
          ...List.generate(project.gaveras.length, (index) {
            return Column(
              children: [
                AppFormTextFild(
                  name: 'returnedGaveras_$index',
                  label:
                      'Gaveras de devueltas ${project.gaveras[index].referenceWeight}',
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.integer(),
                    FormBuilderValidators.min(0),
                  ]),
                ),
                const SizedBox(height: 16),
              ],
            );
          }),
          AppFormTextFild(
            name: 'returnedBaskets',
            label: 'Canastillas devueltas',
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
              FormBuilderValidators.min(0),
            ]),
          ),
          const SizedBox(height: 16),
          AppFormTextFild(
            name: 'returnedPreservativesJars',
            label: 'Tarros conservantes devueltos',
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
              FormBuilderValidators.min(0),
            ]),
          ),
          const SizedBox(height: 16),
          AppFormTextFild(
            name: 'returnedLimeJars',
            label: 'Tarros cal devueltos',
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
              FormBuilderValidators.min(0),
            ]),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: formState.status == Stage4FormStatus.submitting
                ? null
                : () {
                    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
                      return;
                    }
                    final values = _formKey.currentState!.value;
                    final gaveras = <ReturnedGaveras>[];
                    for (int i = 0; i < project.gaveras.length; i++) {
                      gaveras.add(
                        ReturnedGaveras(
                          quantity:
                              int.tryParse(
                                values['returnedGaveras_$i'] ?? '',
                              ) ??
                              0,
                          referenceWeight: project.gaveras[i].referenceWeight,
                        ),
                      );
                    }
                    final data = Stage4FormData(
                      id: init?.id ?? uuid.v4(),
                      projectId: widget.projectId,
                      date: init?.date ?? DateTime.now(),
                      returnedGaveras: gaveras,
                      returnedBaskets: int.parse(
                        values['returnedBaskets'] as String,
                      ),
                      returnedPreservativesJars: int.parse(
                        values['returnedPreservativesJars'] as String,
                      ),
                      returnedLimeJars: int.parse(
                        values['returnedLimeJars'] as String,
                      ),
                    );
                    formNotifier.submit(data, isNew: widget.isNew);
                  },
            child: formState.status == Stage4FormStatus.submitting
                ? const CircularProgressIndicator()
                : Text(widget.isNew ? 'Guardar' : 'Actualizar'),
          ),
        ],
      ),
    );
  }
}
