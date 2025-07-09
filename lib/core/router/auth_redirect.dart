import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/routes.dart';
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

  if (authStatus == AuthStatus.notAuthenticated && path != Routes.login) {
    return Routes.login;
  }

  if (authStatus == AuthStatus.authenticated && path == Routes.login) {
    return Routes.projects;
  }

  final routeRoles = <String, UserRole>{
    Routes.stage1: UserRole.stage1,
    Routes.stage2: UserRole.stage2,
    Routes.stage3: UserRole.stage3,
    Routes.stage4: UserRole.stage4,
    Routes.stage5: UserRole.stage5,
  };

  final requiredRole = routeRoles[path];
  if (requiredRole != null &&
      user?.role != requiredRole &&
      user?.role != UserRole.admin) {
    return Routes.projects;
  }

  return null;
}
