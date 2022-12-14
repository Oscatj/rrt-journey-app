import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:places_autocomplete/app/ui/Pages/login/login.dart';
import 'package:places_autocomplete/app/ui/Pages/register/register.dart';
import 'package:places_autocomplete/app/ui/Pages/reset_password/reset_password.dart';
import 'package:places_autocomplete/app/ui/Pages/splash/splash.dart';
import '../Pages/home/home.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.SPLASH: (_) => const Splash(),
  Routes.HOME: (_) => const Home(),
  Routes.LOGIN: (_) => const Login(),
  Routes.RESET_PASSWORD: (_) => const ResetPassword(),
  Routes.REGISTER: (_) => const Register(),
  Routes.CONFIGUTATION: (_) => Container()
};