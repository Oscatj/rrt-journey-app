import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';
import 'package:places_autocomplete/app/ui/Pages/login/controller/login_controller.dart';
import 'package:places_autocomplete/app/ui/Pages/login/utils/send_login_form.dart';
import 'package:places_autocomplete/app/ui/Pages/register/register.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_widgets/custom_input_field.dart';
import 'package:places_autocomplete/app/utils/email_validator.dart';

class Login extends StatelessWidget {
 const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_,controller){
        return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInputField(
                    label: "Correo electrónico",
                    onChange: controller.onEmailChanged,
                    inputType: TextInputType.emailAddress,
                    validator: (text) {
                        if(isValidEmail(text!)){
                          return null;
                        }else{
                          return "Email Inválido";
                        }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: "Contraseña",
                    onChange: controller.onPasswordChanged,
                    isPassword: true,
                    validator: (text){
                      if(text!.trim().length >= 6){
                        return null;
                      }
                      return "Contraseña inválida";
                    },
                  ),
                  const SizedBox(height:20),
                  ElevatedButton(
                    onPressed: () => SendLoginForm(context),
                    child: const Text('Iniciar Sesion')
                  ),
                  const SizedBox(height:20),
                  ElevatedButton(
                    onPressed: () => router.pushNamed(
                      Routes.REGISTER,
                    ), 
                    child: const Text('Registrarse')
                  ),
                ],
              ),
            ),),
        ),)
    );
      },
    );
  }
}