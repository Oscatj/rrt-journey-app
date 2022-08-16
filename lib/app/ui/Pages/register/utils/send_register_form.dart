import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import '../register.dart' show RegisterProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> SendRegisterForm(BuildContext) async {
  final controller = RegisterProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    final response = await controller.submit();
    if (response.error != null){
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  } else {

  }
}