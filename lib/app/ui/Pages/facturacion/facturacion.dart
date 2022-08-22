import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/agradecimiento/agradecimiento.dart';

class Factura extends StatelessWidget {
  const Factura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 40, 0),
                child: Text(
                  'Resumen del viaje',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.deepOrange,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.close_outlined,
                      color: Colors.deepOrange,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Agradecimiento()
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x2E000000),
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '\$50.00',
                      style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Total a pagar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 128, 127, 127),
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Text(
              'Detalle',
              style: TextStyle(
                fontFamily: 'Poppins',
                  color: Color(0xFFFF4C00),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x2E000000),
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Metro',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Tarjeta Intrant',
                              style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w400,
                              fontSize: 15
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Text(
                        '\$20.00',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x2E000000),
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'OMSA',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Efectivo',
                              style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w400,
                              fontSize: 15
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Text(
                        '\$15.00',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x2E000000),
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'OMSA',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Tarjeta intrant',
                              style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w400,
                              fontSize: 15
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Text(
                        '\$15.00',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}