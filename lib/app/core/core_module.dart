import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_module/theme_module.dart';

import 'shared/services/auth/firebase_auth_service.dart';
import 'shared/services/overlay/asuka_overlay_service.dart';
import 'shared/services/remote/firestore_remote_service.dart';
import 'theme/presenter/default_theme.dart';
import 'theme/presenter/theme_state.dart';
import 'user/user_module.dart';

class CoreModule extends Module {
  @override
  final List<Module> imports = [
    ThemeModule(),
    UserModule(),
  ];

  @override
  final List<Bind> binds = [
    // Theme
    Bind.singleton((i) => AppThemeState(appThemes: i()), export: true),
    Bind.singleton(
      (i) => <IDefaultTheme>{
        DefaultTheme(theme: ThemeData.light()),
        DefaultTheme(theme: ThemeData.dark()),
      },
      export: true,
    ),

    // AuthService
    Bind.singleton(
      (i) => FirebaseAuthService(FirebaseAuth.instance),
      export: true,
    ),

    // RemoteService
    Bind.singleton(
      (i) => FirestoreRemoteService(FirebaseFirestore.instance),
      export: true,
    ),

    // IOverlayService
    Bind.singleton((i) => AsukaOverlayService(), export: true),
  ];
}
