import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Pages/login/controller/login_controller.dart';
import 'package:places_autocomplete/app/ui/Pages/login/login.dart';
import 'package:places_autocomplete/app/ui/Pages/register/controller/register_state.dart';
import 'package:places_autocomplete/app/ui/Pages/register/utils/send_register_form.dart';
import 'package:places_autocomplete/app/ui/Pages/reset_password/reset_password.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';
import 'package:places_autocomplete/app/ui/global_widgets/custom_input_field.dart';
import 'package:places_autocomplete/app/utils/email_validator.dart';
import 'package:places_autocomplete/app/utils/name_validator.dart';

import 'controller/register_controller.dart';
import 'package:flutter_meedu/router.dart' as router;

final RegisterProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: RegisterProvider,
      builder: (_,controller){
        return Scaffold(
          body: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              color: Colors.transparent,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 550,
                      child: Image.asset('assets/logor.png')
                    ),
                    CustomInputField(
                      label: 'Nombre',
                      onChange: controller.onNameChange,
                      validator: (text) {
                        return isValidName(text!) ? null : "Nombre inválido";
                      },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    CustomInputField(
                      label: 'Apellido',
                      onChange: controller.onLastNameChange,
                      validator: (text) {
                        return isValidName(text!) ? null : "Apellido inválido";
                      },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    CustomInputField(
                      label: 'Correo',
                      inputType: TextInputType.emailAddress,
                      onChange: controller.onEmailChange,
                      validator: (text) {
                        return isValidEmail(text!) ? null : "Correo inválido";
                      },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    CustomInputField(
                      label: 'Contraseña',
                      onChange: controller.onPasswordChange,
                      isPassword: true,
                      validator: (text){
                        if (text!.trim().length >= 6){
                          return null;
                        }
                        return "Contraseña inválida";
                      },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    Consumer(
                      builder: (_, watch, __){
                        watch(
                          RegisterProvider.select((_) => 
                          _.password)
                          );
                        return CustomInputField(
                          label: 'Confirmar Contraseña',
                          onChange: controller.onVPasswordChange,
                          isPassword: true,
                          validator: (text){
                            if (text == null) return "Contraseña inválida";
                            if (controller.state.password != text) {
                              return "Las contrasñas no coiciden";
                            } 
                            if (text.trim().length >= 6){
                              return null;
                            }
                            return "Contraseña inválida";
                          },
                        );
                      }),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.deepOrange),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                          ),
                        child: Text('Registrarse'), 
                        onPressed: () => SendRegisterForm(context),
                        ),
                        const SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(
                            color: Colors.deepOrange
                          ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: const Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                        ),
                        )
                      ),
                    ],
                  ),
                  ]),
              ), 
              ),
            ),
        );
      },
    );
  }
}