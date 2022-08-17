import 'package:flutter/cupertino.dart';
import 'package:places_autocomplete/app/domain/response/sign_in_response.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/dialog.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_meedu/router.dart' as router;

import '../login.dart' show loginProvider;

Future<void> SendLoginForm (BuildContext context ) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if(isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
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
}