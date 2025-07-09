import 'package:registro_panela/features/stage1_delivery/domin/stage1_form_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage1_form_provider.g.dart';

enum Stage1FormStatus { initial, submitting, success, error }

@riverpod
class Stage1Form extends _$Stage1Form {
  @override
  Stage1FormState build() => const Stage1FormState();

  Future<void> submit(Stage1FormData data) async {
    state = state.copyWith(status: Stage1FormStatus.submitting);
    // Simulación de guardado y validación extra...
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(status: Stage1FormStatus.success, data: data);
  }

  void reset() {
    state = const Stage1FormState();
  }
}

class Stage1FormState {
  final Stage1FormData? data;
  final Stage1FormStatus status;
  final String? errorMessage;

  const Stage1FormState({
    this.data,
    this.status = Stage1FormStatus.initial,
    this.errorMessage,
  });

  Stage1FormState copyWith({
    Stage1FormData? data,
    Stage1FormStatus? status,
    String? errorMessage,
  }) {
    return Stage1FormState(
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
