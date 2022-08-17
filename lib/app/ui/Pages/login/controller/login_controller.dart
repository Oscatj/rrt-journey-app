
import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';

class LoginController extends SimpleNotifier {
  String _email = "", _password = "";
  final _AuthenticationRepository = Get.i.find<AuthenticationRepository>();
  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }
  void onPasswordChanged(String text) {
    _password = text;
  }
  Future<SignInResponse> submit( ){
    return _AuthenticationRepository.SignInWithEmailAndPassword(
      _email, 
      _password
    );
  }
}