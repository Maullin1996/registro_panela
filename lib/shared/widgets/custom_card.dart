import 'package:flutter/material.dart';
import 'package:registro_panela/shared/utils/tokens.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(AppSpacing.smallLarge),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppRadius.large,
        ), // Bordes redondeados
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.small),
        child: child,
      ),
    );
  }
}
