import 'package:flutter/material.dart';
import 'dart:async';
import 'package:places_autocomplete/app/ui/Pages/agradecimiento/agradecimiento.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/rutas.dart';
import '../../../domain/models/direction.dart' as directions; // <-----------

class Factura extends StatelessWidget {

  final directions.Route route;
  var fecha = DateTime.now();

  Factura({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
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
                    MaterialPageRoute(builder: (context) => Agradecimiento()),
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
              children: [
                Text(
                  '\$${calcularTotal(route)}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    '',
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 127, 127),
                        fontWeight: FontWeight.w500),
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
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: route.legs!.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  // * render Legs
                  children: route.legs!.map((leg) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: leg.steps!.map((step) {
                              if (step.travelMode ==
                                  directions.TravelMode.TRANSIT) {
                                return DetalleFactura(
                                  transportType:
                                      step.transitDetails!.line!.vehicle!.name!,
                                );
                              }
                              return Text('');
                            }).toList()),
                      ],
                    );
                  }).toList(),
                ),
              ],
            );
          }),
      const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
        child: Text(
          'Fecha',
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
              child: Row(
                children: [
                  Text(
                    '${fecha.day}/${fecha.month}/${fecha.year}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${fecha.hour}:${fecha.minute}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 74, 74, 74),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }

}
//////////////////////////

double calcularTotal(directions.Route route){
  double total = 0;

  for (var leg in route.legs!){
    for (var step in leg. steps!){
      if (step.travelMode ==
        directions.TravelMode.TRANSIT) {
          var transportType = step.transitDetails!.line!.vehicle!.name!;

          total += getPrice(transportType);
        }
    }
  }
  return total;
}

///////////////////////////////////
class DetalleFactura extends StatelessWidget {
  const DetalleFactura({
    Key? key,
    this.transportType,
  }) : super(key: key);

  final String? transportType;
  final double? precioBus = 15;
  final double? precioTrain = 20;
  //final double? totalViaje = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  children: [
                    Text((() {
                    if(transportType == 'Autobus'){
                      return "OMSA";
                    } else{
                      return "METRO";
                    }
                  })(),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Efectivo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: Text("${getPrice(transportType!)}",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



double getPrice(String transportType){
  double? precioBus = 15;
  double? precioTrain = 20;

  if(transportType == 'Autobus'){
    return precioBus;
  }
  else{
    return precioTrain;
  }
}
//double getTotal(String totalViaje){

  //return totalViaje == totalViaje++;
//}