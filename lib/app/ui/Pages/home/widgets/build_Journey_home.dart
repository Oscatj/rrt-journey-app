import 'package:flutter/material.dart';

import '../../../../domain/models/journey.dart';

Widget buidJourneyHome(Journey journeys) => Column(
  children: [
    ListTile(
      leading: Icon(Icons.location_on),
                 title: Text('Frecuente'),
                 subtitle: Column(
                   children: [
                     Row(
                       children: [
                         Text('${journeys.origen}'),
                       ],
                     ),
                     Row(
                       children: [
                         Text('${journeys.destino}'),
                       ],
                     ),
                   ],
                 ),
                 trailing: Icon(Icons.arrow_forward_ios, size: 20),
                ),
  ],
);