import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Pages/register/controller/register_state.dart';
import 'package:places_autocomplete/app/ui/Pages/register/utils/send_register_form.dart';
import 'package:places_autocomplete/app/ui/global_widgets/custom_input_field.dart';
import 'package:places_autocomplete/app/utils/email_validator.dart';
import 'package:places_autocomplete/app/utils/name_validator.dart';

import 'controller/register_controller.dart';

final RegisterProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: RegisterProvider,
      builder: (_,controller){
        return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomInputField(
                  label: 'Nombre',
                  onChange: controller.onNameChange,
                  validator: (text) {
                    if (text==null) return null;
                    return isValidName(text) ? null : "Nombre invalido";
                  },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                CustomInputField(
                  label: 'Apellido',
                  onChange: controller.onLastNameChange,
                  validator: (text) {
                    if (text==null) return null;
                    return isValidName(text) ? null : "Apellido invalido";
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
                    if (text==null) return null;
                    return isValidEmail(text) ? null : "Correo invalido";
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
                    if (text == null) return null;
                    if (text.trim().length >= 6){
                      return null;
                    }
                    return "Contraseña incorrecta";
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
                        if (text == null) return null;
                        if (controller.state.password != text) {
                          return "Las contrasñas no coiciden";
                        } 
                        if (text.trim().length >= 6){
                          return null;
                        }
                        return "Contraseña incorrecta";
                      },
                    );
                  }),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    child: const Text('Registrarse'), 
                    color: Colors.deepOrange,
                    onPressed: () => SendRegisterForm(context),
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