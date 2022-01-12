import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starbucks_redesign/pages/splash_screen.dart';
import 'package:starbucks_redesign/utils/routes/routes.dart';

import 'constants/app_theme.dart';
import 'constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.background,
      debugShowCheckedModeBanner: false,
      title: 'Starbucks',
      theme: themeData,
      routes: Routes.routes,
      home: const SplashScreen(),
    );
  }
}
