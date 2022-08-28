import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';
import 'package:places_autocomplete/app/domain/response/firestore_services.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/widgets/buid_widget_myrouter.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Text(
                'Rutas Personalizadas',
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
      body: StreamBuilder<List<RutasPersonalizadas>>(
          stream: readMyRoutes(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: Text(
                      '¡Ups!', 
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22
                        ),
                      ),                     
                    ),
                    Icon(Icons.warning, color: Colors.deepOrange)
                  ],
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Center(child: Text(
                        'Algo ha salido mal',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                           fontSize: 18
                          ),
                      )
                    ),
                      SizedBox(height: 10),
                      Center(child: Text(
                        'Favor intentarlo más tarde', 
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                           fontSize: 18
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        
                        fontSize: 15
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }else if(snapshot.hasData){
              final myRoutes = snapshot.data!;
              return ListView(
                children: myRoutes.map(buidMyRoutes).toList(),
              );
            }else {
              return const Center(
                child: CircularProgressIndicator()
              );
            }
          }
          
        ),
    );
  }
}