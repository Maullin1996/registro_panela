import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:registro_panela/features/stage1_delivery/presentation/providers/stage1_project_by_id_provider.dart';
import 'package:registro_panela/core/theme/utils/tokens.dart';
import 'package:registro_panela/features/stage5_1_missing_weight/presentation/pages/web_stage5_summary.dart';
import 'package:registro_panela/features/stage5_2_records/presentation/pages/web_stage52_missing_weight.dart';
import 'package:registro_panela/shared/widgets/icon_decoration.dart';
import '../../../shared/web_layout.dart';
import '../../../stage5_3_summary/presentation/pages/web_stage53_page.dart';

class WebStage5Page extends ConsumerStatefulWidget {
  final String projectId;
  const WebStage5Page({super.key, required this.projectId});

  @override
  ConsumerState<WebStage5Page> createState() => _WebStage5PageState();
}

class _WebStage5PageState extends ConsumerState<WebStage5Page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = ref.watch(stage1ProjectByIdProvider(widget.projectId));
    final textTheme = TextTheme.of(context);

    if (project == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return WebLayout(
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      child: Column(
        children: [
          // ── Header ────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.small,
              AppSpacing.small,
              AppSpacing.small,
              0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.small,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryDarkPanela,
              borderRadius: BorderRadius.circular(AppRadius.extraLarge),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textDark.withAlpha(20),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: IconDecoration(
                        icon: Icons.arrow_back_ios_new,
                        iconColor: AppColors.accentLightPanela,
                        backgroundColor: AppColors.backgroundCrema,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.small),
                    Expanded(
                      child: Text(
                        project.name.toUpperCase(),
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.textLight,
                          letterSpacing: 0.3,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.small),
                TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.accentLightPanela.withAlpha(45),
                    borderRadius: BorderRadius.circular(AppRadius.large),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.accentLightPanela,
                  unselectedLabelColor: AppColors.textLight.withAlpha(150),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: AppTypography.h5,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: AppTypography.h5,
                  ),
                  tabs: const [
                    Tab(icon: Icon(Icons.summarize), text: 'Resumen'),
                    Tab(icon: Icon(Icons.report), text: 'Reporte'),
                    Tab(icon: Icon(Icons.inventory), text: 'Entrega'),
                  ],
                ),
              ],
            ),
          ),

          // ── Contenido ─────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                WebStage5Summary(projectId: widget.projectId),
                WebStage52MissingWeight(projectId: widget.projectId),
                WebStage53Page(projectId: widget.projectId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
