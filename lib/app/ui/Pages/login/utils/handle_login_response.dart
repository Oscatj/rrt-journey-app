import 'package:flutter/cupertino.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';
import '../../../Routes/routes.dart';
import '../../../global_widgets/dialogs/dialog.dart';
import 'package:flutter_meedu/router.dart' as router;

void handleLoginResponse(BuildContext context, SignInResponse response){
      if(response.error != null){
      String errorMessage = "";
      switch (response.error){

        case SignInError.networkRequestFailed:
          errorMessage = "Usted no tiene conexión a internet";
          break;
        case SignInError.userDisable:
          errorMessage = "Su usuario se encuentra inhabilitado";
          break;
        case SignInError.tooManyRequests:
          errorMessage= "Deamasiadas peticiones realizadas";
          break;
        case SignInError.userNotFoumd:
          errorMessage = "El usuario no es correcto";
          break;
        case SignInError.wrongPassword:
          errorMessage = "Contraseña incorrecta";
          break;
        case SignInError.invalidCredential:
          errorMessage = "Credenciales invalidas";
          break;
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = response.providerId??"Cuenta en uso con otro método";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "Error desconocido";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: errorMessage
        );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
}