import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:places_autocomplete/app/domain/models/rutasPersonalizadas.dart';
import 'package:places_autocomplete/app/domain/response/firestore_services.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/myRoutes.dart';

Widget buidMyRoutes(RutasPersonalizadas myRoutes) => Column(
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
                                    '${myRoutes.nombre}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                  Text('${myRoutes.origen}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      )),
                                  Text('${myRoutes.destino}',
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
                                  onPressed: () {}, icon: Icon(Icons.edit, color: Colors.blue,)),
                                ),
                                Align(
                                  child: IconButton(
                                    onPressed: () {
                                      deletRutas('');
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
    
