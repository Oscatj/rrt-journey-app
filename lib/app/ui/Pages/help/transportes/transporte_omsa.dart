import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/help/help.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';
import '../../rutas/search_autocomplete.dart';

class TransporteOmsa extends StatelessWidget {
  const TransporteOmsa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Help()
                    ),
                  );
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
                    'Metro y teleférico',
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.deepOrange,
                      unselectedLabelColor: Colors.black,
                      //labelStyle: Colors.deepOrange,
                      indicatorColor: Colors.deepOrange,
                      tabs: [
                        Tab(
                          text: 'Paradas',
                        ),
                        Tab(
                          text: 'Tarifas',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
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
                          ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                child: Container(
                                  width: 100,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFEFEF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Servicio económico',
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(1, 0),
                                                  child: Text(
                                                    'RD\$10.00',
                                                    style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFFF0000),
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(-1, 0),
                                          child: Text(
                                            'Es nuestro servicio más económico, en autobuses sin aire acondicionado y con detenciones en todas las paradas\n',
                                            style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                child: Container(
                                  width: 100,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFEFEF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Servicio normal',
                                                style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(1, 0),
                                                  child: Text(
                                                    'RD\$15.00',
                                                    style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color(0xFFFF0000),
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(-1, 0),
                                          child: Text(
                                            'Es el mismo tipo de servicio normal pero con aire acondicionado incluido\n',
                                            style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
                                child: Text(
                                  'Normas dentro del autobus',
                                  style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.deepOrange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                      child: Text(
                                        'Siempre tener pasaje en menudo',
                                        style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.payments,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No pagar con papeletas mayores de RD\$100.00',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.smoke_free,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No fumar',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.no_meals_sharp,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No comer',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.restore_from_trash_outlined,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No tirar basura dentro del autobús',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.emoji_nature,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 10),
                                        child: Text(
                                          'No arrojar objetos desde dentro del autobús',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.broken_image_sharp,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No hacer ningún daño al autobús',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'Tener respeto hacia el conductor y al cobrador',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.workspaces_filled,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 0),
                                        child: Text(
                                          'No cargar objetos o bultos pesados',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.emoji_people,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(2, 0, 10, 10),
                                        child: Text(
                                          'Pedir su parada con tiempo, antes de llegar a la misma',
                                          style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
