import 'package:registro_panela/features/auth/domin/authenticated_user.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthParams {
  final AuthenticatedUser? user;
  final AuthStatus authStatus;
  final String? errorMessage;

  const AuthParams({
    this.user,
    this.authStatus = AuthStatus.notAuthenticated,
    this.errorMessage,
  });

  AuthParams copyWith({
    AuthenticatedUser? user,
    AuthStatus? authStatus,
    String? errorMessage,
  }) {
    return AuthParams(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
