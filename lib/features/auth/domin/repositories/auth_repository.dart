import 'package:registro_panela/features/auth/domin/entities/authenticated_user.dart';

abstract class AuthRepository {
  Future<AuthenticatedUser> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
