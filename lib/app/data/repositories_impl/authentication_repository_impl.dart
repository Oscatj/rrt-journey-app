
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/response/reset_password_response.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';
import 'package:places_autocomplete/app/ui/Pages/reset_password/reset_password.dart';

//import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl(this._auth){
    //print('Se creo una nueva auntenticacion');
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() async {
    _auth.authStateChanges().listen(
      (User? user){
        if(!_completer.isCompleted){
          _completer.complete();
        }
        _user = user;
      }
    );
  }
  
  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
  
  @override
  Future<SignInResponse> SignInWithEmailAndPassword(String email, String password) async {
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );
      final user = userCredential.user!;
      return SignInResponse(null, user);
    }on FirebaseAuthException catch(e){
      return SignInResponse(parseStringToSignUpError(
         e.code), null);
    }
  }
  
  @override
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) async {
    try{
    await  _auth.sendPasswordResetEmail(email: email);
    return ResetPasswordResponse.ok;
    } on FirebaseException catch (e){
    return  stringToResetPasswordResponse(e.code);
    }
  }
}