import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:places_autocomplete/app/domain/inputs/sign_up.dart';
import 'package:places_autocomplete/app/ui/Pages/register/controller/register_state.dart';

import '../../../../domain/repositories/sign_up_repository.dart';

class RegisterController extends StateNotifier<RegisterState>{
  RegisterController(): super(RegisterState.initialState);
  
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.i.find<SignUpRepository>();

  Future <SignUpResponse> submit(){
   return _signUpRepository.register(
      SignUpData(
        name: state.name, 
        lastname: state.lastname, 
        email: state.email, 
        password: state.password
      ),
    );
  }

  void onNameChange (String text){
    state = state.copyWith(name: text);
  }
  void onLastNameChange (String text){
    state = state.copyWith(lastname: text);
  }
  void onEmailChange (String text){
    state = state.copyWith(email: text);
  }
  void onPasswordChange (String text){
    state = state.copyWith(password: text);
  }
  void onVPasswordChange (String text){
    state = state.copyWith(vpassword: text);
  }

}