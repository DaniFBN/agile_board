import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/forgot_password/forgot_password_module.dart';
import 'submodules/login/login_module.dart';
import 'submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute<LoginModule>('/login', module: LoginModule()),
    ModuleRoute<ForgotModule>('/forgot-password', module: ForgotModule()),
    ModuleRoute<RegisterModule>('/register', module: RegisterModule()),
  ];
}
