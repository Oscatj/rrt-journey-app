import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/help/help.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';
import '../../rutas/search_autocomplete.dart';

class TransportesGeneral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.deepOrange,
            ),
          ),
        ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget> [
              Row(
                children: const [
                  Text(
                    'Transportes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.deepOrange
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 18),
            ],
          ),
     body: ListView(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
          child: Text(
            'Metro de Santo Domingo',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 58, 58, 58),
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 9, 95, 224),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'L1',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Centro de los Heroes-Mamá Tingó',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'L2',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Concepción Bona-María Montez',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                  child: Text(
                                    'L1B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 8,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Concepción Bona-María Montez',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
          child: Text(
            'Teleféricoo de Santo Domingo',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 58, 58, 58),
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const  Color.fromARGB(255, 157, 175, 76),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'T1',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Estación de Gualey',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 157, 175, 76),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'T2',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Estación de Tres Brazos',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 157, 175, 76),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'T3',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Estación de Sabana Perdida',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
          child: Text(
            'OMSA de Santo Domingo',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 58, 58, 58),
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Induveca S.A. - Hipódromo',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Puerto Haina - Parque Independicia',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Mamá Tingó - Hipódromo',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Concepción Bona - C. Juan Bosch',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Puerto Haina Oriental - Hipódromo',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Km 9 1/2 Aut. Duarte - Av. Núñez',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 10),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:Colors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Z.F. Los Alcarrizos - Puerto Haina',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
 
      ],
    ),
  );
}
}

