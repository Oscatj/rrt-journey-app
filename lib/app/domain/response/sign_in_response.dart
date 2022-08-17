import 'package:firebase_auth/firebase_auth.dart';

class SignInResponse {
  final SignInError? error;
  final User? user;

  SignInResponse(this.error, this.user);
}

enum SignInError {
  networkRequestFailed,
  userDisable,
  userNotFoumd,
  wrongPassword,
  unknown,
}

SignInError parseStringToSignUpError(String code) {
  switch(code){
    case "user-disabled":
      return SignInError.userDisable;
    case "user-not-found":
      return SignInError.userNotFoumd;
    case "network-request-failed":
      return SignInError.networkRequestFailed;
    case "wrong-password":
      return SignInError.wrongPassword;
    default:
      return SignInError.unknown;
  }
}