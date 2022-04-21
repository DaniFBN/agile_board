import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute<SplashModule>(Modular.initialRoute, module: SplashModule()),
    ModuleRoute<AuthModule>(Modular.initialRoute, module: AuthModule()),
    ModuleRoute<HomeModule>('/home', module: HomeModule()),
  ];
}
