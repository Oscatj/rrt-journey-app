import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:places_autocomplete/app/domain/repositories/directions.repository.dart';
import 'package:places_autocomplete/app/ui/Pages/facturacion/facturacion.dart';
import '../../../domain/models/direction.dart';

class Rutas extends StatefulWidget {
  final DetailsResult? startPosition; // <------ add this
  final DetailsResult? endPosition; // <------ add this
  

  const Rutas({super.key, this.startPosition, this.endPosition});

  @override
  State<Rutas> createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  var service = DirectionsRepository();
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    //DetailsResult? origen = widget.startPosition;
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
             'Rutas posibles',
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
      body: FutureBuilder(
        future: service.getDirections(
          // * Complete response
          widget.startPosition!.formattedAddress!, // <------ add this
          widget.endPosition!.formattedAddress!, // <------ add this
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var directions = snapshot.data as Direction;
            var routes = directions.routes;
            return ListView.builder(
              // * render Routes
              itemCount: directions.routes!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color.fromARGB(221, 243, 243, 243),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Ruta ${index + 1}',
                            style: const TextStyle(
                                color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          Column(
                            // * render Legs
                            children: routes![index].legs!.map((leg) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Tiempo estimado: ${leg.duration!.text}',
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Column(
                                    // * render Steps
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: leg.steps!.map((step) {
                                      if (step.travelMode == TravelMode.WALKING) {
                                      return StepWidget(
                                        instructions: step.htmlInstructions!,
                                        color: Colors.grey.withOpacity(0.5),
                                      );
                                    } else if (step.travelMode ==
                                        TravelMode.TRANSIT) {
                                          //if(TravelMode.TRANSIT == ){}
                                      return StepTransitWidget(
                                        color: Colors.deepOrange,
                                        instructions: step.htmlInstructions!,
                                        //busName: step.transitDetails!.line!.shortName!,
                                        transportType: step.transitDetails!.line!.vehicle!.name!,
                                        precio: 15,
                                      );
                                    }
                                      return Text('--${step.htmlInstructions}');
                                    }).toList()
                                  ),                                  
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.deepOrange),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            )
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                          builder: (context) => Factura()
                                          ),
                                              );
                                        },
                                        child: const Text('Aceptar')
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          } else {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                        strokeWidth: 10,
                      )),
                ],
              ),
            );
          }
        },
      ),
    );
  }
  Future createJourney({
    required DetailsResult origen,
    required String destino, 
    DateTime? fecha,
  })async{
    final journey = FirebaseFirestore.instance.collection('journeys').doc('my-id');

    final json = {
      'origen': origen,
      'destino': destino,
      'fecha': fecha
    };
  }

}

class StepWidget extends StatelessWidget {
  const StepWidget({
    Key? key,
    required this.instructions,
    this.color,
  }) : super(key: key);

  final String instructions;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.directions_walk),
        ),
        Container(
          height: 50,
          width: 5,
          color: color,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Text(
              instructions,
              softWrap: true,
            ),
          ),
        )
      ],
    );
  }
}
class StepTransitWidget extends StatelessWidget {
  const StepTransitWidget({
    Key? key,
    required this.instructions,
    this.color,
    this.busName,
    this.transportType,
    required this.precio,
  }) : super(key: key);

  final String? busName;
  final String instructions;
  final String? transportType;
  final Color? color;
  final double precio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.directions_bus_rounded),
        ),
        Container(
          height: 50,
          width: 5,
          color: color,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipo de vehículo: ${transportType!}',
                  softWrap: true,
                ),/*
                Text(
                  busName!,
                  softWrap: true,
                ),*/
                Text(
                  instructions,
                  softWrap: true,
                ),
                Text(
                  'Precio: DOP\$ ${precio.toString()}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500
                  )

                )
              ],
            ),
          ),
        )
      ],
    );
  }
}