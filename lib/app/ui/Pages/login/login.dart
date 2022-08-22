import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';
import 'package:places_autocomplete/app/ui/Pages/login/controller/login_controller.dart';
import 'package:places_autocomplete/app/ui/Pages/login/utils/send_login_form.dart';
import 'package:places_autocomplete/app/ui/Pages/login/widgets/social.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';
import 'package:places_autocomplete/app/ui/global_widgets/custom_input_field.dart';
import 'package:places_autocomplete/app/utils/email_validator.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

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
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 550,
                      child: Image.asset('assets/logor.png')
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => router.pushNamed(Routes.RESET_PASSWORD), 
                          child: const Text (
                            '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                              color: Colors.deepOrange
                            ),
                          ),
                          ),
                          const SizedBox(width: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.deepOrange),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                          ),
                          onPressed: () => SendLoginForm(context),
                          child: const Text('Iniciar Sesion')
                        ),
                      ],
                    ),
                    const SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿No tienes una cuenta?',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                            ),
                        ),
                        TextButton(
                          onPressed: () => router.pushNamed(
                            Routes.REGISTER,
                          ), 
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange
                          ),
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height:30),
                    Text(
                      "Iniciar sesion con",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                            ),
                    ),
                    SizedBox(height: 10),
                    const SocialButtons(),
                  ],
                ),
                )
              ],
            ),),
        ),)
    );
      },
    );
  }
}