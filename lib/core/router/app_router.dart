import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/core/router/auth_redirect.dart';
import 'package:registro_panela/core/router/go_router_notifier.dart';
import 'package:registro_panela/core/router/routes.dart';
import 'package:registro_panela/features/auth/presentation/login_page.dart';
import 'package:registro_panela/features/project_selector/presentation/project_selector_page.dart';
import 'package:registro_panela/features/stage1_delivery/presentation/stage1_page.dart';
import 'package:registro_panela/features/stage2_load/presentation/stage2_page.dart';
import 'package:registro_panela/features/stage3_weigh/presentation/stage3_form_page.dart';
import 'package:registro_panela/features/stage3_weigh/presentation/stage3_page.dart';
import 'package:registro_panela/features/stage3_weigh/presentation/stage3_page_summary.dart';
import 'package:registro_panela/features/stage4_recollection/presentation/stage4_load_form_page.dart';
import 'package:registro_panela/features/stage4_recollection/presentation/stage4_page.dart';
import 'package:registro_panela/features/stage4_recollection/providers/stage4_load_provider.dart';

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
      GoRoute(
        name: 'stage3Detail',
        path: '${Routes.stage3}/:projectId',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          return Stage3Page(projectId: projectId);
        },
      ),
      GoRoute(
        name: 'stage3Form',
        path: '${Routes.stage3}/:projectId/:load2Id/form',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          final load2Id = state.pathParameters['load2Id']!;
          return Stage3FormPage(projectId: projectId, load2Id: load2Id);
        },
      ),
      GoRoute(
        name: 'stage3Summary',
        path: '${Routes.stage3}/:projectId/:load2Id/summary',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          final load2Id = state.pathParameters['load2Id']!;
          return Stage3PageSummary(load2Id: load2Id, projectId: projectId);
        },
      ),
      GoRoute(
        name: 'stage4Detail',
        path: '${Routes.stage4}/:projectId',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          return Stage4Page(projectId: projectId);
        },
      ),
      GoRoute(
        name: 'stage4Form',
        path: '${Routes.stage4}/:projectId/new',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          return Stage4LoadFormPage(projectId: projectId, isNew: true);
        },
      ),
      GoRoute(
        name: 'stage4FormEdit',
        path: '${Routes.stage4}/:projectId/:returnId/edit',
        builder: (context, state) {
          final projectId = state.pathParameters['projectId']!;
          final returnId = state.pathParameters['returnId']!;
          final data = ref
              .read(stage4LoadProvider)
              .firstWhere((r) => r.id == returnId);
          return Stage4LoadFormPage(
            projectId: projectId,
            initialData: data,
            isNew: false,
          );
        },
      ),
    ],
  );
});
