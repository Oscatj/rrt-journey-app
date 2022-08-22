import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/login/login.dart';
import 'package:places_autocomplete/app/ui/Pages/login/utils/handle_login_response.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';

void singInWithGoogle(BuildContext context) async{
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.singInWithGoogle();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}
