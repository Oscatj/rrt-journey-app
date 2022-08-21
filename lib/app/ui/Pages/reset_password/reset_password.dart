import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:places_autocomplete/app/domain/response/reset_password_response.dart';
import 'package:places_autocomplete/app/ui/Pages/reset_password/controller/reset_password_controller.dart';
import 'package:places_autocomplete/app/ui/global_widgets/custom_input_field.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/dialog.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:places_autocomplete/app/utils/email_validator.dart';

final ResetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
      provider: ResetPasswordProvider,
      builder: (_,controller) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
       child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Restablecer contraseña",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Al ingresar su correo electrónico recibirá un link para restablecer su contraseña",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 20),
                CustomInputField(
                  onChange: controller.onEmailChanged,
                  label: "Correo",
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.deepOrange
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  onPressed: () => _submit(context), 
                  child: const Text('Enviar'),
                ),
                const SizedBox(height: 30),
              ]
            ),
          ),
        ),
      ),
    ),
    );
  }
  void _submit(BuildContext context) async {
    final controller  = ResetPasswordProvider.read;
    if(isValidEmail(controller.email)){
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if(response == ResetPasswordResponse.ok){
        Dialogs.alert(
          context,
          title: "Completado",
          content: "Correo enviado"
        );
      }else{
        String errorMessage = '';
        switch(response){

          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = 'Sin acceso a internet';
            break;
          case ResetPasswordResponse.userDisable:
            errorMessage = 'Usuario deshabilitado';
            break;
          case ResetPasswordResponse.userNotFound:
            errorMessage = 'Usuario no encontrado';
            break;
          case ResetPasswordResponse.tooManyRequests:
            errorMessage = 'Demasiadas peticiones realizadas';
            break;
          case ResetPasswordResponse.unknown:
          default:
            errorMessage = 'Error no identificado';
            break;
        }
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Hubo un error en el envío"
        );
      }
    }else {
      Dialogs.alert(context, content: "Correo inválido");
    }
  }
}
