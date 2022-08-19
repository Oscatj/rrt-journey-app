import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';
import '../rutas/search_autocomplete.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);
  
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis rutas',
          style: TextStyle(color: Colors.deepOrange),
        ),
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
            actions: <Widget>[
              IconButton(
                onPressed: (){
                  showSearch(context: context, delegate: DataSearch());
                }, 
                icon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            )
          )
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
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

class DataSearch extends SearchDelegate<String> {
  final ciudades = [
    "Distrito Nacional",
    "Azua de Compostela",
    "Estebanía",
    "Guayabal",
    "Las Yayas de Viajama",
    "Padre Las Casas",
    "Peralta",
    "Pueblo Viejo",
    "Villa Jaragua",
    "Barahona",
    "Cabral",
    "La Ciénaga",
    "Vicente Noble",
    "Dajabón",
    "Las Salinas",
    "Loma de Cabrera",
    "Restauración",
    "San Francisco de Macorís",
    "Arenoso",
    "Eugenio María de Hostos",
  ];

  final recientes = [
    "Peralta",
    "Pueblo Viejo",
    "Villa Jaragua",
    "Barahona",
    "Cabral",
    "La Ciénaga",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      onPressed: (){
        query = "";
      }, 
      icon: Icon(Icons.clear))
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.push(
          context, 
            MaterialPageRoute(
              builder: (context) => MyRoutes()
            ),
        );
      }, 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchAutocomplete();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty 
    ? recientes 
    : ciudades.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionsList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: suggestionsList[index].substring(query.length),
                style: TextStyle(
                  color: Colors.grey
                ),
              )
            ]
          )
        ),
      ),
      itemCount: suggestionsList.length,
    );
  }

}
