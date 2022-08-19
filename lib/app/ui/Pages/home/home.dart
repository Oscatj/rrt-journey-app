import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';

import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

import '../../Routes/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final iconColor = isDark ? Colors.white: Colors.deepOrange;
    final textColor = isDark ? Colors.grey: Color.fromARGB(255, 99, 99, 99);
    final buttonColor = isDark ? Colors.white: Colors.grey.shade300;
    return Scaffold(
          //bottomNavigationBar: HomeTabBar(),
          drawer: const NavBar(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: (){
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
            actions: <Widget> [
              Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon (
                      Icons.location_on,
                      color: Colors.deepOrange
                    ),
                  ),
                  const Text(
                    'RRT-JOURNEY',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.deepOrange
                    ),
                  ),
                ],
              ),
              SizedBox(width: 18),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(30),
            children: [
               Container(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(18.481966138520633, -69.97355341320986),
                      zoom: 14,
                    ),
                    myLocationEnabled: true,         
                    mapType: MapType.normal                    
                  ),
                //padding: const EdgeInsets.all(30),
                  height: 180.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: buttonColor,
                        shape: StadiumBorder(),
                        elevation: 0,
                        padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                        child: Text(
                          '¿A dónde vamos?',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> SearchAutocomplete())
                          );
                        },
                      ),
                    ],
                  ),    
                SizedBox(height: 20,),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Frecuente'),
                      subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 20),
                    ),

                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Frecuente'),
                      subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                  ],
                ),
                Divider(),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text('Casa'),
                      subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text('Trabajo'),
                      subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                  ],
                ),
            ], 
         )
        );
      }
}