import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/forgot_controller.dart';
import 'presenter/pages/forgot_page.dart';
import 'presenter/stores/forgot_store.dart';

class ForgotModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ForgotStore(i())),
    Bind.factory((i) => ForgotController(forgotStore: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<ForgotPage>('/', child: (_, __) => ForgotPage()),
  ];
}
