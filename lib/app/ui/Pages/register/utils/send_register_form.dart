import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/response/sign_up_response.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/dialog.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';
import '../register.dart' show RegisterProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> SendRegisterForm(BuildContext context) async {
  final controller = RegisterProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null){
      String content = "";
      switch(response.error){
        case SignUpError.networkRequestFailed:
          content = "Usted no tiene conexión a internet";
          break;
        case SignUpError.emailAlreadyInUse:
          content = "Correo inválido";
          break;
        case SignUpError.weakPassword:
          content = "Contraseña inválida";
          break;
        case SignUpError.unknown:
        default:
          content = "Error desconocido";
          break;
      }
      Dialogs.alert(
        context,
        title: "ERROR",
        content: content
        );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  } else {
    Dialogs.alert(
      context,
      title: "ERROR",
      content: "Campos inválidos"
      );
  }
}