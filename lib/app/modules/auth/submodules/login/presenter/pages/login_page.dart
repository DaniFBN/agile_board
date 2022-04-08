import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.passwordController,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.onTapForgot,
                  child: const Text('Esqueci minha senha'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.onTapLogin,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(size.width * 0.4),
                ),
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Ainda não é um usuário? '),
                    TextSpan(
                      text: 'Cadastre-se',
                      recognizer: TapGestureRecognizer()
                        ..onTap = controller.onTapRegister,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
