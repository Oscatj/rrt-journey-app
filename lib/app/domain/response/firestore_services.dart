import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

      //final prefs = await SharedPreferences.getInstance();
      //await prefs.setStringList()
      await docRoutes.set(json);
    }
  }
