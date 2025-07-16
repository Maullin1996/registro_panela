import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/domain/stage5_price_form.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/providers/global_missing_provider.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/providers/stage5_price_form_state_provider.dart';
import 'package:registro_panela/shared/widgets/app_form_text_fild.dart';
import 'package:uuid/uuid.dart';

class Stage5MissingWeight extends ConsumerWidget {
  final String projectId;
  const Stage5MissingWeight({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary3 = ref.watch(stage3GlobalSummaryProvider(projectId));
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        children: [
          Text(
            'Resumen de peso faltante',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text('Canastillas esperadas: ${summary3.totalExpectedCount}'),
          Text(
            'Peso esperado: ${summary3.totalExpectedWeight.toStringAsFixed(2)} kg',
          ),
          const SizedBox(height: 8),
          Text('Canastillas registradas: ${summary3.totalRegisteredCount}'),
          Text(
            'Peso registrado: ${summary3.totalRegisteredWeight.toStringAsFixed(2)} kg',
          ),
          if (summary3.totalMissingCount != 0 ||
              summary3.totalMissingWeight != 0)
            Column(
              children: [
                const Divider(height: 32),
                if (summary3.totalMissingCount != 0)
                  Text(
                    'Canastillas Faltantes: ${summary3.totalMissingCount}',
                    style: TextStyle(color: Colors.red[700]),
                  ),
                if (summary3.totalMissingWeight != 0)
                  Text(
                    'Faltan: ${summary3.totalMissingWeight.toStringAsFixed(2)} kg',
                    style: TextStyle(color: Colors.red[700]),
                  ),
              ],
            ),
          const SizedBox(height: 24),
          _FormTotalToPay(
            projectId: projectId,
            totalRegisteredWeight: summary3.totalRegisteredWeight,
          ),
        ],
      ),
    );
  }
}

class _FormTotalToPay extends ConsumerStatefulWidget {
  final double totalRegisteredWeight;
  final String projectId;
  const _FormTotalToPay({
    this.totalRegisteredWeight = 0,
    required this.projectId,
  });

  @override
  ConsumerState<_FormTotalToPay> createState() => __FormTotalToPayState();
}

class __FormTotalToPayState extends ConsumerState<_FormTotalToPay> {
  final _formKey = GlobalKey<FormBuilderState>();
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(stage5PriceFormProvider);
    final formNotifier = ref.read(stage5PriceFormProvider.notifier);
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Total a pagar',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          AppFormTextFild(
            name: 'pricePerKilo',
            label: 'Valor por kilo:',
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
              FormBuilderValidators.min(1),
            ]),
          ),
          const SizedBox(height: 24),
          AppFormTextFild(
            name: 'installment',
            label: 'Se realizaron abonos:',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 34),
          if (formState.data != null)
            Column(
              children: [
                Text('Valor total: ${formState.totalToPay}'),
                const SizedBox(height: 34),
              ],
            ),
          FloatingActionButton.extended(
            onPressed: formState.status == Stage5PriceFormStatus.submitting
                ? null
                : () {
                    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
                      return;
                    }

                    final values = _formKey.currentState!.value;

                    final data = Stage5PriceFormData(
                      id: uuid.v4(),
                      projectId: widget.projectId,
                      date: DateTime.now(),
                      pricePerKilo:
                          int.tryParse(values['pricePerKilo'] ?? '0') ?? 0,
                      installment:
                          int.tryParse(values['installment'] ?? '0') ?? 0,
                    );
                    formNotifier.submit(
                      projectId: widget.projectId,
                      data: data,
                      totalRegisteredWeight: widget.totalRegisteredWeight,
                    );
                  },
            label: Text('Calcular'),
          ),
        ],
      ),
    );
  }
}
