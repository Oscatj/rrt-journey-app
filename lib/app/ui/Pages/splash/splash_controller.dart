import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final _authRepository = Get.i.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController){
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if(user != null){
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    }else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }
}