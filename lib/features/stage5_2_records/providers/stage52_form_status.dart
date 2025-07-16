import 'package:registro_panela/features/stage5_2_records/domain/stage52_record_data.dart';
import 'package:registro_panela/features/stage5_2_records/providers/stage52_load_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage52_form_status.g.dart';

enum Stage52FormStatus { initial, submitting, success, error }

class Stage52FormState {
  final Stage52FormStatus status;
  final String? errorMessage;
  const Stage52FormState({
    this.status = Stage52FormStatus.initial,
    this.errorMessage,
  });
}

@riverpod
class Stage52Form extends _$Stage52Form {
  @override
  Stage52FormState build() => const Stage52FormState();

  Future<void> submit({required Stage52RecordData data}) async {
    state = const Stage52FormState(status: Stage52FormStatus.submitting);
    try {
      // aquí iría llamada real al backend
      await Future.delayed(const Duration(milliseconds: 300));

      // on success, añadimos al provider global
      ref.read(stage52LoadProvider.notifier).add(data);
      state = const Stage52FormState(status: Stage52FormStatus.success);
    } catch (e) {
      state = Stage52FormState(
        status: Stage52FormStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
