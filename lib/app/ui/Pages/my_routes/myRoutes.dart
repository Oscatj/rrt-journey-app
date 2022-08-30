import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';
import 'package:places_autocomplete/app/domain/response/firestore_services.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';

class MyRoutes extends StatefulWidget {
  const MyRoutes({Key? key}) : super(key: key);

  @override
  State<MyRoutes> createState() => _MyRoutesState();
}

class _MyRoutesState extends State<MyRoutes> {
  final CollectionReference _rutas = FirebaseFirestore.instance
  .collection('rutasPersonalizadas');

  final nombreController = TextEditingController();
  final stardController = TextEditingController();
  final endController = TextEditingController();

  Future<void> _delete (String idRuta) async {
    await _rutas.doc(idRuta).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Ruta eliminada con exito')
    ));
  }

  Future<void> _update ([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      nombreController.text = documentSnapshot['nombre'];
      stardController.text = documentSnapshot['origen'];
      endController.text = documentSnapshot['destino'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height:50),
                      (
                        Text(
                          'Nombre de la ruta:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18
                          ),
                        )
                      ),
                    ],
                  ),
                  (
                  TextField(
                    controller: nombreController,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration (
                      border: InputBorder.none,
                      hintText: "Ejemplo: Casa",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15,
                        color: Color.fromARGB(255, 153, 153, 153),
                      ),
                        filled: true,
                        fillColor: Colors.grey[200],
                    )
                  )
                  ),
                  (
                    SizedBox(height:20)
                  ),
                  Row(
                    children: [
                      (
                        Text(
                          'Origen:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18
                          ),
                        )
                      ),
                    ],
                  ),
                  (
                  TextField( 
                    controller: stardController,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration (
                      
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                    )
                  )
                  ),
                  (
                    SizedBox(height:20)
                  ),
                  Row(
                    children: [
                      (
                        Text(
                          'Destino:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18
                          ),
                        )
                      ),
                    ],
                  ),
                  (
                  TextField(
                    controller: endController,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration (
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                    )
                  )
                  ),
                  (
                    SizedBox(height:20)
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.deepOrange,
                    ),
                    child: (
                      TextButton(
                            onPressed: () async{
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => MyRoutes()
                                ),
                              );
                              final nombre = nombreController.text;
                              final origen = stardController.text;
                              final destino = endController.text;
                              if(nombre != '' && origen != '' && destino != ''){
                                await _rutas
                                  .doc(documentSnapshot!.id)
                                  .update({"nombre": nombre, "origen": origen, "destino":destino});
                                nombreController.text = '';
                                stardController.text = '';
                                endController.text = '';
                              }
                            }, 
                            child: Text(
                              'Actualizar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                              ),
                            )
                          )
                    ),
                  )
                ],
                
              ),
              
            )
          );
      },
     );
  }

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
      body: StreamBuilder(
          stream: _rutas.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
            if(streamSnapshot.hasError){
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
            }else if(streamSnapshot.hasData){
              final myRoutes = streamSnapshot.data!;
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [                          
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 280,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  documentSnapshot['nombre'],
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                ),
                                                Text(documentSnapshot['origen'],
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 15,
                                                  )),
                                                Text(documentSnapshot['destino'],
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black54,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                child: IconButton(
                                                  onPressed: () {
                                                    _update(documentSnapshot);
                                                  }, 
                                                  icon: Icon(
                                                    Icons.edit, 
                                                    color: Colors.blue,
                                                    )
                                                  ),
                                              ),
                                              Align(
                                                child: IconButton(
                                                  onPressed: () {
                                                    
                                                  _delete(documentSnapshot.id);
                                                  },
                                                  icon: Icon(Icons.delete, color: Colors.red,)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider()
                    ],
                  );
                },
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