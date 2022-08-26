import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Routes/app_routes.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/global_controller/theme_controller.dart';

import 'ui/Pages/rutas/rutas.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final theme = watch(themeProvider);
        return MaterialApp(
          title: 'RRT-JOURNEY',
          navigatorKey: router.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
          darkTheme: ThemeData.dark(
            
          ),
          theme: ThemeData.light(),
          themeMode: theme.mode,
          navigatorObservers: [
            router.observer,
          ],
          routes: appRoutes,
    );
      });
  }
}