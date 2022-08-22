
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;

  String _email = "", _password = "";
  final _AuthenticationRepository = Get.i.find<AuthenticationRepository>();

  final GlobalKey<FormState> formKey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }
  void onPasswordChanged(String text) {
    _password = text;
  }
  Future<SignInResponse> singInWithEmailAndPassword() async {
    final response = await _AuthenticationRepository.SignInWithEmailAndPassword(
      _email, 
      _password
    );
    if (response.error == null){
      _sessionController.setUser(response.user!);
    }
    return response;
  }
  Future<SignInResponse> singInWithGoogle() async {
   final response = await _AuthenticationRepository.SignInWithGoogle();
   if(response.error == null){
    _sessionController.setUser(response.user!);
   }
   return response;
  }
}