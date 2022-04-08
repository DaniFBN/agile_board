import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/register_controller.dart';
import 'presenter/pages/register_page.dart';
import 'presenter/stores/register_store.dart';

class RegisterModule extends Module { 
  @override
  final List<Bind> binds = [
    Bind.factory((i) => RegisterStore(i())),
    Bind.factory((i) => RegisterController(registerStore: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<RegisterPage>('/', child: (_, __) => RegisterPage()),
  ];
}
