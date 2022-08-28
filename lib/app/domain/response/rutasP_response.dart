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