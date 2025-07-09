import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/features/auth/domin/auth_status.dart';
import 'package:registro_panela/features/auth/domin/authenticated_user.dart';
import '../../features/auth/providers/auth_provider.dart';

/// Control de acceso por estado de auth y rol
String? authRedirect(Ref ref, GoRouterState state) {
  final auth = ref.read(authProvider);
  final user = auth.user;
  final authStatus = auth.authStatus;
  final path = state.uri.path;

  if (authStatus == AuthStatus.checking) return '/splash';

  if (authStatus == AuthStatus.notAuthenticated && path != '/login') {
    return '/login';
  }

  if (authStatus == AuthStatus.authenticated && path == '/login') {
    return '/projects';
  }

  final routeRoles = <String, UserRole>{
    '/stage1': UserRole.stage1,
    '/stage2': UserRole.stage2,
    '/stage3': UserRole.stage3,
    '/stage4': UserRole.stage4,
    '/stage5': UserRole.stage5,
  };

  final requiredRole = routeRoles[path];
  if (requiredRole != null &&
      user?.role != requiredRole &&
      user?.role != UserRole.admin) {
    return '/projects';
  }

  return null;
}
