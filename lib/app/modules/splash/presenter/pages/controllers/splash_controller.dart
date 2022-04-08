import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_module/theme_module.dart';

import '../../../../../core/user/presenter/stores/user_store.dart';

class SplashController {
  const SplashController(this.userStore);

  final UserStore userStore;

  Future<void> init() async {
    userStore.loadUserData();

    await Future.wait([
      Modular.get<ThemeStore>().loadState(),
      Future<void>.delayed(const Duration(seconds: 3)),
    ]);

    if (userStore.isLogged) return _goToHome();

    _goToLogin();
  }

  void _goToLogin() => Modular.to.navigate('/login/');
  void _goToHome() => Modular.to.navigate('/home/');
}
