import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(style: textTheme.headlineSmall, text: firstText),
          TextSpan(style: textTheme.bodyLarge, text: secondText),
        ],
      ),
    );
  }
}
