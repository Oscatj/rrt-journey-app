import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places_autocomplete/app/domain/models/journey.dart';
/*
final isDark = context.isDarkMode;
  final iconColor = isDark ? Colors.white: Colors.deepOrange;
  final textColor = isDark ? Colors.grey: Color.fromARGB(255, 99, 99, 99);
  final buttonColor = isDark ? Colors.white: Colors.grey.shade300;


Widget buidJourne(Journey journeys) => ListView(
  
            padding: const EdgeInsets.all(20),
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
                      subtitle: Text(''),
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
);
}*/