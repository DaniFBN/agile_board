import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/helpers/params.dart';
import '../stores/login_store.dart';

class LoginController implements Disposable {
  LoginController({
    required LoginStore loginStore,
  }) : _loginStore = loginStore {
    _loginStore.selectError.addListener(_showDialog);
  }

  final LoginStore _loginStore;

  final emailController = TextEditingController(text: 'dev@dev.com');
  final passwordController = TextEditingController(text: 'Abcd1234');

  void onTapRegister() => Modular.to.pushNamed('/register/');
  void onTapForgot() => Modular.to.pushNamed('/forgot-password/');
  void _goToSplash() => Modular.to.pushNamed('/');

  Future<void> onTapLogin() async {
    final param = LoginParam(
      email: emailController.text,
      password: passwordController.text,
    );
    await _loginStore.login(param);

    if (!_loginStore.hasError) _goToSplash();
  }

  void _showDialog() {
    if (!_loginStore.hasError) return;

    final snackBar = SnackBar(
      content: Text(_loginStore.error!.message, textAlign: TextAlign.center),
      backgroundColor: Colors.redAccent,
    );

    asuka.showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _loginStore.selectError.removeListener(_showDialog);
  }
}
