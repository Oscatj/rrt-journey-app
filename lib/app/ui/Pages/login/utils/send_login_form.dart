import 'package:flutter/cupertino.dart';
import 'package:places_autocomplete/app/ui/Pages/login/utils/handle_login_response.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:flutter_meedu/router.dart' as router;

import '../login.dart' show loginProvider;

Future<void> SendLoginForm (BuildContext context ) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if(isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.singInWithEmailAndPassword();
    router.pop();
    handleLoginResponse(context, response);
  }
}