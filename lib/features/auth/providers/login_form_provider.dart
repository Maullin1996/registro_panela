import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_provider.g.dart';

@riverpod
class LoginForm extends _$LoginForm {
  @override
  LoginFormState build() => LoginFormState();

  void onEmailChanged(String value) {
    state = state.copyWith(
      email: value,
      isValid: _validateForm(value, state.password),
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      password: value,
      isValid: _validateForm(state.email, value),
    );
  }

  bool _validateForm(String email, String password) {
    return email.contains('@') && password.length >= 6;
  }

  void reset() {
    state = LoginFormState();
  }
}

class LoginFormState {
  final String email;
  final String password;
  final bool isValid;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.isValid = false,
  });

  LoginFormState copyWith({String? email, String? password, bool? isValid}) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}
