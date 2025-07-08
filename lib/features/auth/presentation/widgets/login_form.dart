import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:registro_panela/features/auth/providers/auth_provider.dart';
import 'package:registro_panela/features/auth/providers/login_form_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final formNotifier = ref.read(loginFormProvider.notifier);
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: formNotifier.onEmailChanged,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            onChanged: formNotifier.onPasswordChanged,
            decoration: const InputDecoration(labelText: 'Contraseña'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: form.isValid
                ? () {
                    ref
                        .read(authProvider.notifier)
                        .login(email: form.email, password: form.password);
                    context.go('/projects');
                  }
                : null,
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
