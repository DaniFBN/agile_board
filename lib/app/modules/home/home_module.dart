import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controller/task_controller.dart';
import 'presenter/pages/home_page.dart';
import 'presenter/stores/task_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => TaskStore(i())),
    Bind.singleton((i) => TaskController(taskStore: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<HomePage>(
      '/',
      child: (context, __) => HomePage(
        taskController: context.read<TaskController>(),
      ),
    )
  ];
}
