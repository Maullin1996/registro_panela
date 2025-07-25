import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/features/auth/providers/auth_provider.dart';

class GoRouterNotifier extends ChangeNotifier {
  final Ref ref;

  GoRouterNotifier(this.ref) {
    ref.read(authProvider.notifier).checkAuthStatus();
  }
}
