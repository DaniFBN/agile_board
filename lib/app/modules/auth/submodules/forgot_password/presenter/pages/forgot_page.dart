import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/forgot_controller.dart';

class ForgotPage extends StatelessWidget {
  ForgotPage({Key? key}) : super(key: key);

  final controller = Modular.get<ForgotController>();

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
              ElevatedButton(
                onPressed: controller.onTapForgot,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(size.width * 0.4),
                ),
                child: const Text('Enviar email'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: controller.onTapCancel,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(size.width * 0.4),
                ),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
