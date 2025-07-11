import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/auth_redirect.dart';
import 'package:registro_panela/core/router/go_router_notifier.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/auth/presentation/login_page.dart';
import 'package:registro_panela/features/project_selector/presentation/project_selector_page.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/stage1_page.dart';
import 'package:registro_panela/features/stage2_load/presentation/stage2_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = GoRouterNotifier(ref);

  return GoRouter(
    initialLocation: Routes.login,
    refreshListenable: notifier,
    redirect: (context, state) => authRedirect(ref, state),

    routes: [
      GoRoute(path: Routes.login, builder: (_, __) => const LoginPage()),
      GoRoute(
        path: Routes.projects,
        builder: (_, __) => const ProjectSelectorPage(),
      ),
      GoRoute(
        name: 'stage1',
        path: '${Routes.stage1}/:projectId',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          return Stage1Page(projectId: projectId);
        },
      ),
      GoRoute(
        name: 'stage2Detail',
        path: '${Routes.stage2}/:projectId',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          return Stage2Page(projectId: projectId);
        },
      ),
    ],
  );
});
