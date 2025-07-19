import 'package:flutter/material.dart';
import 'package:registro_panela/shared/utils/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
        side: BorderSide(
          color: AppColors.inputBorder, // Color del borde
          width: 2, // Grosor del borde
        ),
      ),
      elevation: 2,
      child: child,
    );
  }
}
