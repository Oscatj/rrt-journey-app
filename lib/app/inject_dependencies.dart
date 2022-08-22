import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:places_autocomplete/app/data/repositories_impl/account_repository_impl.dart';
import 'package:places_autocomplete/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:places_autocomplete/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:places_autocomplete/app/domain/repositories/account_repository.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:places_autocomplete/app/domain/repositories/sign_up_repository.dart';

void injectDependencies(){
  Get.i.lazyPut<AuthenticationRepository>( 
    ()=> AuthenticationRepositoryImpl(FirebaseAuth.instance, GoogleSignIn()),
    );
  Get.i.lazyPut<SignUpRepository>( 
    ()=> SignUpRepositoryImpl(FirebaseAuth.instance),
    );
  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ));
}