import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Pages/help/help.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/my_routes.dart';
import 'package:places_autocomplete/app/ui/Pages/profile/profile.dart';
import 'package:places_autocomplete/app/ui/Pages/help/transportes/transport._Metro_Tel.dart';
import 'package:places_autocomplete/app/ui/Pages/record/record.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

class NavBar extends ConsumerWidget{
  const NavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProvider);
    final user = sessionController.user!;

    final displayName = user.displayName ??'';
    final letter = displayName.isNotEmpty ? displayName[0] : '';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: (){ 
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Profile()
                ),
              );
            },
            accountName: Consumer (builder: (_, watch, __) {
                final user = watch(sessionProvider).user!;
                return Text(
                  displayName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                );
              }
            ),   
            accountEmail: Text(
              user.email??'',
                style: TextStyle(
                  fontSize: 14,
                )
            ),
            currentAccountPicture: CircleAvatar(
              child: CircleAvatar(
                radius: 65,
                child: 
                user.photoURL == null 
                ? Text(
                  letter,
                  style: (
                    TextStyle(
                      fontSize: 45,
                    )
                  ),
                ) 
                : null,
                backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!): null,
              ),
            ),
            decoration: BoxDecoration (
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.xtrafondos.com/wallpapers/degradado-difuminado-naranja-7945.jpg",
                ),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text ("Home"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Home()
                ),
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.location_history),
            title: Text ("Mis Rutas"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => MyRoutes()
                ),
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text ("Historial"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Record()
                ),
              );
            }
          ),
          Divider(),/*
          ListTile(
            leading: Icon(Icons.settings),
            title: Text ("Configuración"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Settings()
                ),
              );
            }
          ),*/
          ListTile(
            leading: Icon(Icons.help),
            title: Text ("Ayuda"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Help()
                ),
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text ("Cerrar Sesión"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () async {
                await sessionProvider.read.SignOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              }
          )
        ],
      ),
    );
  }
}
