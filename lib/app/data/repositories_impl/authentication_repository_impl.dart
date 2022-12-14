import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/response/reset_password_response.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn; 
  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl(this._auth, this._googleSignIn){
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
      return SignInResponse(
        user: user, 
        providerId: userCredential.credential?.providerId,
        error: null
      );
    }on FirebaseAuthException catch(e){
      return getSignUpError(e);
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
  
  @override
  Future<SignInResponse> SignInWithGoogle() async {
    try{
     final account = await _googleSignIn.signIn();
     if (account == null) {
      return SignInResponse(
        error: SignInError.unknown,
        user: null, 
        providerId: null
      );
     }

     final googleAuth = await account.authentication;

     final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
     );

    final userCredential = await _auth.signInWithCredential(
      oAuthCredential
    );
    return SignInResponse(
      error: null, 
      user: userCredential.user, 
      providerId: userCredential.credential?.providerId
    );
    }on FirebaseAuthException catch(e){
      e.credential?.providerId;
      return getSignUpError(e);
    }
  }
}