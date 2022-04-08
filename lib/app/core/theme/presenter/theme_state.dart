import 'package:flutter/material.dart';
import 'package:theme_module/theme_module.dart';

class AppThemeState extends IAppThemeState {
  const AppThemeState({
    required Set<IDefaultTheme> appThemes,
    int current = 0,
  }) : super(appThemes: appThemes, current: current);

  @override
  IAppThemeState copyWith({required int current}) {
    return AppThemeState(
      current: current,
      appThemes: appThemes,
    );
  }

  @override
  ThemeData get currentTheme => appThemes.elementAt(current).theme;

  @override
  bool get isDark => currentTheme.brightness == Brightness.dark;
}
