import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCkyvpVgnxMFnpbEEuMjkt3jwp88CH_8wQ',
      authDomain: 'agile-board-dev.firebaseapp.com',
      projectId: 'agile-board-dev',
      storageBucket: 'agile-board-dev.appspot.com',
      messagingSenderId: '36004750563',
      appId: '1:36004750563:web:1b42978cca2548c6e391d6',
      measurementId: 'G-JCHXRFCVJF',
    ),
  );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
