import 'package:registro_panela/features/stage5_1_missing_weight/domain/stage5_price_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stage5_price_form_state_provider.g.dart';

enum Stage5PriceFormStatus { initial, submitting, success, error }

class Stage5PriceFormState {
  final Stage5PriceFormData? data;
  final Stage5PriceFormStatus status;
  final String? errorMessage;
  final double totalToPay;

  const Stage5PriceFormState({
    this.totalToPay = 0,
    this.data,
    this.status = Stage5PriceFormStatus.initial,
    this.errorMessage,
  });

  Stage5PriceFormState copyWith({
    double? totalToPay,
    Stage5PriceFormData? data,
    Stage5PriceFormStatus? status,
    String? errorMessage,
  }) {
    return Stage5PriceFormState(
      totalToPay: totalToPay ?? this.totalToPay,
      data: data ?? this.data,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}

@riverpod
class Stage5PriceForm extends _$Stage5PriceForm {
  @override
  Stage5PriceFormState build() => const Stage5PriceFormState();

  Future<void> submit({
    required String projectId,
    required Stage5PriceFormData data,
    required double totalRegisteredWeight,
  }) async {
    state = state.copyWith(status: Stage5PriceFormStatus.submitting);

    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final double totalToPay =
          data.pricePerKilo * totalRegisteredWeight - data.installment;

      state = state.copyWith(
        status: Stage5PriceFormStatus.success,
        data: data,
        totalToPay: totalToPay,
      );

      state = state.copyWith(totalToPay: totalToPay);
    } catch (e) {
      state = state.copyWith(
        totalToPay: 0,
        status: Stage5PriceFormStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
