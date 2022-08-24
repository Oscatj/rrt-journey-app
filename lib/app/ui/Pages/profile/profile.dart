import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';
import 'package:places_autocomplete/app/ui/global_controller/theme_controller.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/dialog.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:places_autocomplete/app/ui/global_widgets/dialogs/show_input_dialog.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  void _updateDisplayName(BuildContext context) async {
    final sessionController = sessionProvider.read;
    final value = await ShowInputDialog(
      context,
      initialValue: sessionController.user!.displayName ?? ""
    );
    if(value != null){
      ProgressDialog.show(context);
      final user = sessionController.updateDisplayName(value);
      Navigator.pop(context);
      if (user == null ){
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Verifique su conexión a internet"
        );
      }
    }
  } 
  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProvider);
    final user = sessionController.user!;
    final theme = watch(themeProvider);

    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : '';

    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.deepOrange,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            SizedBox(width: 18),
          ],
        ),
        body: ListView(
          children: [
             CircleAvatar(
              backgroundColor: Colors.deepOrange,
                radius: 80,
                child: user.photoURL == null 
                ? Text(
                  letter,
                  style: (
                    TextStyle(
                      fontSize: 70,
                      color: Colors.white
                    )
                  ),
                ) 
                : null,
                backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!): null,
              ),
            SizedBox(height: 10),
            Center(
                child: Text(
              displayName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Center(
              child: Text(
                user.email ?? '',
                style: const TextStyle(
                fontSize: 17)
              )
            ),
            const SizedBox(height: 20),
            LabelButton(
              label: "Nombre de usuario", 
              value: displayName,
              onPressed: () => _updateDisplayName(context),
            ),
            LabelButton(
              label: "Correo electrónico", 
              value: user.email!
            ),
            LabelButton(
              label: "Verificación de correo", 
              value: user.emailVerified?"Sí" : "No"
            ),            
            ListTile(
              leading: const Text(
                'Cambiar modo',
                style: TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.w500
                ),
              ),
              trailing: CupertinoSwitch(
              activeColor: Colors.deepOrange,
              value: theme.isDark, 
              onChanged: (_){
                themeProvider.read.toggle();
              }
            ),
            ),
            const SizedBox(height: 90),
            //Divider(),
            TextButton(
              onPressed: () {}, 
              child: const Text(
                "Eliminar cuenta",
                style: TextStyle(
                  color: Colors.red,
                fontSize: 16
                ),
              ))
          ],
        ));
  }
}

class LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const LabelButton(
    {Key? key, 
    required this.label, 
    required this.value, 
    this.onPressed
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        onTap: onPressed,
        leading: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.chevron_right,
              color: onPressed != null ? Colors.black : Colors.transparent,
            )
          ],
        )
      );
  }
}
