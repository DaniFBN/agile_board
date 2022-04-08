import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/controllers/splash_controller.dart';
import 'presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => SplashController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<SplashPage>('/', child: (_, __) => const SplashPage()),
  ];
}
