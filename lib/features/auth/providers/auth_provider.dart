import 'package:registro_panela/features/auth/domin/auth_status.dart';
import 'package:registro_panela/features/auth/domin/authenticated_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthParams build() {
    checkAuthStatus();
    return const AuthParams();
  }

  void login({required String email, required String password}) {
    if (!email.contains('@') || password.length < 6) {
      state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        errorMessage: 'Correo o contraseña inválidos',
      );
      return;
    }
    final role = email.contains('admin') ? UserRole.admin : UserRole.stage1;

    state = state.copyWith(
      user: AuthenticatedUser(
        id: '1',
        name: 'Mauricio',
        email: email,
        role: role,
        token: 'fake-token',
      ),
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  void logout() {
    state = const AuthParams(authStatus: AuthStatus.notAuthenticated);
  }

  Future<void> checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    state = const AuthParams(authStatus: AuthStatus.notAuthenticated);
  }
}
