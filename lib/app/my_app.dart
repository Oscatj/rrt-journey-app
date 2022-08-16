import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Routes/app_routes.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

import '../app/ui/Pages/Rutas.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RRT-JOURNEY',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}