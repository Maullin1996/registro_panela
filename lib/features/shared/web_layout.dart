import 'package:flutter/material.dart';
import 'package:registro_panela/core/theme/utils/tokens.dart';

class WebLayout extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  const WebLayout({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCrema,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.small,
              AppSpacing.small,
              AppSpacing.small,
              AppSpacing.small,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryDarkPanela,
                borderRadius: BorderRadius.circular(AppRadius.extraLarge),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textDark.withAlpha(46),
                    blurRadius: 28,
                    offset: const Offset(8, 12),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: NavigationRail(
                backgroundColor: Colors.transparent,
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                labelType: NavigationRailLabelType.all,
                indicatorColor: AppColors.accentLightPanela.withAlpha(50),
                indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
                selectedIconTheme: const IconThemeData(
                  color: AppColors.accentLightPanela,
                ),
                selectedLabelTextStyle: const TextStyle(
                  color: AppColors.accentLightPanela,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTypography.h5,
                  letterSpacing: 0.2,
                ),
                unselectedIconTheme: IconThemeData(
                  color: AppColors.textLight.withAlpha(140),
                ),
                unselectedLabelTextStyle: TextStyle(
                  color: AppColors.textLight.withAlpha(140),
                  fontSize: AppTypography.h5,
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSpacing.medium,
                    bottom: AppSpacing.smallLarge,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundCrema,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(height: AppSpacing.small),
                      Container(
                        width: 24,
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.accentLightPanela,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.folder_outlined),
                    selectedIcon: Icon(Icons.folder),
                    label: Text('Proyectos'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.inventory_2_outlined),
                    selectedIcon: Icon(Icons.inventory_2),
                    label: Text('Inventario'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.admin_panel_settings_outlined),
                    selectedIcon: Icon(Icons.admin_panel_settings),
                    label: Text('Admin'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.store_outlined),
                    selectedIcon: Icon(Icons.store),
                    label: Text('Moliendas'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
