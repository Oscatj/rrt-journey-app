import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';

Future createRoutes({ 
    String? id,
    required String nombre,
    required String origen,
    required String destino, 
  })async{
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
  

  Stream<List<RutasPersonalizadas>> readMyRotes()=> FirebaseFirestore.instance
  .collection('rutasPersonalizadas')
  .snapshots()
  .map((snapshot) =>
      snapshot.docs.map((doc) => RutasPersonalizadas.fromJson(doc.data())).toList());

/*
class FirebaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Recuperando datos desde firestore
  Stream<List<RutasPersonalizadas>> readMyRutas() {
    return _db
      .collection('rutasPersonalizadas')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => RutasPersonalizadas.fromJson(doc.data()))
      .toList());
    }
  //Actualizando y modificando datos desde firestore
  Future<void> setRutas(RutasPersonalizadas rutasP){
    return _db
    .collection('rutasPersonalizadas')
    .doc(rutasP.idRutasP)
    .set(rutasP.toMap());
  }

  Future<void> deletRutas(String idRutasP){
    return _db
    .collection('rutasPersonalizadas')
    .doc(idRutasP)
    .delete();
  }
}
*/