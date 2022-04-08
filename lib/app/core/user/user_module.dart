import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/stores/user_store.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserStore(i()), export: true),
  ];
}
