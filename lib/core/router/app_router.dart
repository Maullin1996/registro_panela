import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/auth_redirect.dart';
import 'package:registro_panela/core/router/go_router_notifier.dart';
import 'package:registro_panela/features/auth/presentation/login_page.dart';
import 'package:registro_panela/features/project_selector/presentation/project_selector_page.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/stage1_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = GoRouterNotifier(ref);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) => authRedirect(ref, state),

    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(
        path: '/projects',
        builder: (_, __) => const ProjectSelectorPage(),
      ),
      GoRoute(path: '/stage1', builder: (context, state) => const Stage1Page()),
    ],
  );
});
