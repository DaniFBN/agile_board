import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_email_usecase.dart';
import 'external/login_email_datasource.dart';
import 'infra/repositories/login_email_repository.dart';
import 'presenter/controllers/login_controller.dart';
import 'presenter/pages/login_page.dart';
import 'presenter/stores/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // LoginEmail
    Bind.factory((i) => LoginEmailDatasourceImpl(authService: i())),
    Bind.factory((i) => LoginEmailRepositoryImpl(i())),
    Bind.factory((i) => LoginEmailUsecaseImpl(i())),

    // Store
    Bind.factory((i) => LoginStore(loginEmailUsecase: i())),

    // Controller
    Bind.factory(
      (i) => LoginController(
        loginStore: i(),
        overlayService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute<LoginPage>(
      '/',
      child: (context, __) => LoginPage(
        controller: context.read<LoginController>(),
      ),
    ),
  ];
}
