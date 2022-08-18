import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/ui/Pages/help/help.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/my_routes.dart';
import 'package:places_autocomplete/app/ui/Pages/public_transport/public_transport.dart';
import 'package:places_autocomplete/app/ui/Pages/record/record.dart';
import 'package:places_autocomplete/app/ui/Pages/setting/setting.dart';
import 'package:places_autocomplete/app/ui/Routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Consumer(
              builder: (_, watch, __) {
                final user = watch(sessionProvider).user!;
                return Text(user.displayName ?? '');
              }
            );
    return Drawer(
      // backgroundColor: Colors.deepOrange,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Consumer (builder: (_, watch, __) {
                final user = watch(sessionProvider).user!;
                return Text(user.displayName ?? '');
              }), 
            accountEmail: Text("oscarinatj@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval (
                child: Image.network("https://i0.wp.com/thehappening.com/wp-content/uploads/2017/07/foto-perfil-5.jpg?resize=1024%2C694&ssl=1",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                )
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
          ListTile(
            leading: Icon(Icons.bus_alert),
            title: Text ("Transportes"),
            trailing: Icon(Icons.arrow_forward_ios, size: 20,),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => PublicTransport()
                ),
              );
            }
          ),
          Divider(),
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
          ),
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