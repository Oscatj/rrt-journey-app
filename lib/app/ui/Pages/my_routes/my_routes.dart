import 'package:flutter/material.dart';

import '../home/home.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);
  
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Home()
                    ),
                  );
            }, 
            icon: const Icon(
              Icons.arrow_back,
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
              Text(
                'Mis Rutas',
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
        children: [
          //SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Buscar ruta guardada",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.black)
                )
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Casa'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Trabajo'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city_sharp),
            title: Text('Escuela'),
            subtitle: Text('Centro de los Heroes - Bus: Induveca S.A. - Hipódromo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ],
      )
    );
  }
}