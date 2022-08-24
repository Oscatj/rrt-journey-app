import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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