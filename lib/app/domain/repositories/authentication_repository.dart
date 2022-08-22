import 'package:firebase_auth/firebase_auth.dart';
import 'package:places_autocomplete/app/domain/response/reset_password_response.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';

abstract class AuthenticationRepository {
    Future<User?> get user;
    Future<void> signOut();
    Future<SignInResponse> SignInWithEmailAndPassword(
      String email, 
      String password
    );
    Future<SignInResponse> SignInWithGoogle();
    Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}

