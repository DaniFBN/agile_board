import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_module/theme_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<IAppThemeState>(
      valueListenable: Modular.get<ThemeStore>().selectState,
      builder: (_, appTheme, __) {
        return MaterialApp.router(
          title: 'Agile Board',
          builder: asuka.builder,
          debugShowCheckedModeBanner: false,
          themeMode: appTheme.isDark ? ThemeMode.light : ThemeMode.dark,
          theme: appTheme.currentTheme,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        );
      },
    );
  }
}
