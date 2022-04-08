import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/forgot_store.dart';

class ForgotController implements Disposable {
  ForgotController({
    required ForgotStore forgotStore,
  }) : _forgotStore = forgotStore {
    _forgotStore.selectError.addListener(_showDialog);
  }

  final ForgotStore _forgotStore;

  final emailController = TextEditingController();

  void _goToLogin() => Modular.to.navigate('/login');
  void onTapCancel() => _goToLogin();

  Future<void> onTapForgot() async {
    await _forgotStore.sendResetEmail(emailController.text);

    if (!_forgotStore.hasError) _goToLogin();
  }

  void _showDialog() {
    if (!_forgotStore.hasError) return;

    final snackBar = SnackBar(
      content: Text(_forgotStore.error!.message, textAlign: TextAlign.center),
      backgroundColor: Colors.redAccent,
    );

    asuka.showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _forgotStore.selectError.removeListener(_showDialog);
  }
}
