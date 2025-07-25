import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:registro_panela/features/auth/domin/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
