import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/login_controller.dart';
import 'presenter/pages/login_page.dart';
import 'presenter/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => LoginStore(i())),
    Bind.factory((i) => LoginController(loginStore: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<LoginPage>('/', child: (_, __) => LoginPage()),
  ];
}
