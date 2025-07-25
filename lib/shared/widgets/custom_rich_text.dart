import 'package:flutter/material.dart';
import 'package:registro_panela/shared/utils/spacing.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final IconData icon;
  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: AppSpacing.xSmall),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(style: textTheme.headlineMedium, text: firstText),
              TextSpan(style: textTheme.bodyLarge, text: secondText),
            ],
          ),
        ),
      ],
    );
  }
}
