import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/features/stage4_recollection/domin/stage4_form_data.dart';
import 'package:registro_panela/features/stage4_recollection/presentation/widgets/stage4_load_form.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_form_provider.dart';

class Stage4LoadFormPage extends ConsumerWidget {
  final String projectId;
  final Stage4FormData? initialData;
  final bool isNew;

  const Stage4LoadFormPage({
    super.key,
    required this.projectId,
    this.initialData,
    this.isNew = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<Stage4FormState>(stage4FormProvider, (prev, next) {
      if (prev?.status == Stage4FormStatus.submitting &&
          next.status == Stage4FormStatus.success) {
        context.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Pesajes guardados')));
      }
      if (next.status == Stage4FormStatus.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage ?? 'Error')));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(isNew ? 'Nueva devolución' : 'Editar devolución'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Stage4LoadForm(
          projectId: projectId,
          initialData: initialData,
          isNew: isNew,
        ),
      ),
    );
  }
}
