import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/journey.dart';

Widget buidJourney(Journey journeys) => Column(
  children: [
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 2,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 90,
                            height: 90,             
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${journeys.fecha}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )  
                                    ),
                                    const Text(
                                      'Desde: ',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const Text(
                                      'Hasta:',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Container(
                                width: 240,
                                height: 100,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Text(''),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Text(
                                        '${journeys.origen}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                         ),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1,10),
                                      child: Text(
                                        '${journeys.destino}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
  ],
);
