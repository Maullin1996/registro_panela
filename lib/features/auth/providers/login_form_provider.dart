import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_panela/features/auth/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_provider.freezed.dart';
part 'login_form_provider.g.dart';

@freezed
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isValid,
    @Default(false) bool isSubmitting,
  }) = _LoginFormState;
}

@riverpod
class LoginForm extends _$LoginForm {
  @override
  LoginFormState build() => const LoginFormState();

  void onEmailChanged(String value) {
    state = state.copyWith(email: value);
    _validate();
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(password: value);
    _validate();
  }

  _validate() {
    final validEmail = state.email.contains('@');
    final validPassword = state.password.length >= 6;
    state = state.copyWith(isValid: validEmail && validPassword);
  }

  Future<void> submit() async {
    // marca que estamos enviando
    state = state.copyWith(isSubmitting: true);
    // si tu login va a ser async con API real, await aquí
    await Future.delayed(const Duration(milliseconds: 300));
    ref
        .read(authProvider.notifier)
        .login(email: state.email, password: state.password);
    state = state.copyWith(isSubmitting: false);
  }
}
