import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';

Widget buidRoutesSaved(RutasPersonalizadas myRoutes) => 
    ListTile(
      leading: Icon(Icons.star),
      title: Text('${myRoutes.nombre}'),
      subtitle: Column(
        children: [
          Text('${myRoutes.origen}'),
          Text('${myRoutes.destino}')
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 20),
);