import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/response/reset_password_response.dart';

class ResetPasswordController extends SimpleNotifier{
  String _email = '';
  String get email  => _email;

  final _authenticationRepository = Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text){
    _email = text;
  }

  Future<ResetPasswordResponse> submit(){
    return _authenticationRepository.sendResetPasswordLink(email);
  } 
}