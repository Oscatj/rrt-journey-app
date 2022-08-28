import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';
import '../models/journey.dart';

//Listar viaje
Stream<List<Journey>> readJourneys()=> FirebaseFirestore.instance
.collection('journeys')
.snapshots()
.map((snapshot) =>
    snapshot.docs.map((doc) => Journey.fromJson(doc.data())).toList());

//Crear viaje
Future createJourney({
    String? id,
    required String origen,
    required String destino, 
    String? fecha,
  })async{
    if(origen != '' && destino != ''){
      final docJourney = FirebaseFirestore.instance.collection('journeys').doc();
          final journey = Journey(
            id: docJourney.id,
            origen: origen,
            destino: destino,
            fecha: fecha
          );
      final json = journey.toJson();

      await docJourney.set(json);
    }
  }

  //Rutas Personalizadas

  //Listar rutas
  Stream<List<RutasPersonalizadas>> readMyRoutes()=> FirebaseFirestore.instance
  .collection('rutasPersonalizadas')
  .snapshots()
  .map((snapshot) =>
      snapshot.docs.map((doc) => RutasPersonalizadas.fromJson(doc.data())).toList());

  Future createRoutes({ 
    String? id,
    required String nombre,
    required String origen,
    required String destino, 
  })async{
    if(nombre != '' && origen != '' && destino != ''){
      final docRoutes = FirebaseFirestore.instance.collection('rutasPersonalizadas').doc();
          final routes = RutasPersonalizadas(
            id: docRoutes.id,
            nombre: nombre,
            origen: origen,
            destino: destino,
          );
      final json = routes.toJson();

      await docRoutes.set(json);
    }
  }

  Future<void> deletRutas(String idRutasP) => FirebaseFirestore.instance
    .collection('rutasPersonalizadas')
    .doc(idRutasP)
    .delete();
