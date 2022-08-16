import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:places_autocomplete/app/ui/Pages/login/login.dart';
import 'package:places_autocomplete/app/ui/Pages/splash/splash.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.SPLASH: (_) => const Splash(),
  Routes.HOME: (_) => Container(),
  Routes.LOGIN: (_) => const Login(),
};