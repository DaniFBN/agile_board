import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/helpers/params.dart';
import '../stores/register_store.dart';

class RegisterController implements Disposable {
  RegisterController({
    required RegisterStore registerStore,
  }) : _registerStore = registerStore {
    _registerStore.selectError.addListener(_showDialog);
  }

  final RegisterStore _registerStore;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _goToLogin() => Modular.to.navigate('/login');
  void onTapCancel() => _goToLogin();

  Future<void> onTapRegister() async {
    final param = RegisterParam(
      email: emailController.text,
      password: passwordController.text,
    );
    await _registerStore.register(param);

    if (_registerStore.isSuccess) _goToLogin();
  }

  void _showDialog() {
    if (!_registerStore.hasError) return;

    final snackBar = SnackBar(
      content: Text(_registerStore.error!.message, textAlign: TextAlign.center),
      backgroundColor: Colors.redAccent,
    );

    asuka.showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _registerStore.selectError.removeListener(_showDialog);
  }
}
