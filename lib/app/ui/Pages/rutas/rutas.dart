import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';
import 'package:places_autocomplete/app/ui/global_controller/theme_controller.dart';
import 'package:places_autocomplete/services/directions.repository.dart';
import '../../../domain/models/direction.dart';

class Rutas extends StatefulWidget {
  @override
  State<Rutas> createState() => _RutasState();
}

class _RutasState extends State<Rutas> {

  var service = DirectionsRepository();
  bool isLoading = true;

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
                builder: (context) => SearchAutocomplete()
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
            //mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Rutas Posibles',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.deepOrange
                ),
              ),
            ],
          ),
          SizedBox(width: 18),
        ],
      ),
      body: FutureBuilder(
        // future: getPlaces(18.457666, -69.943963),
        future: service.getDirections(
          // * Complete response
          'Residencial Anaconda, Santo Domingo',
          'Av 27 de Febrero, Santo Domingo',
        ),
        // future: service.getDirections(
        //   // * Complete response
        //   'Residencial Anaconda, Santo Domingo',
        //   'Av 27 de Febrero, Santo Domingo',
        // ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var directions = snapshot.data as Direction;
            var routes = directions.routes;
            return ListView.builder(
              // * render Routes
              itemCount: directions.routes!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text ('Ruta ${index + 1}', style: 
                        TextStyle(
                          color: Colors.deepOrange, fontSize: 18,
                          fontWeight: FontWeight.w500
                          ) ),
                        Column(
                          // * render Legs
                          children: routes![index].legs!.map((leg) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Tiempo estimado: ${leg.duration!.text}', 
                                style: TextStyle(fontWeight: FontWeight.w500),),
                                //Text(
                                   // '(${leg.departureTime!.text} - ${leg.arrivalTime!.text})'),
                                Column(
                                  // * render Steps
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: leg.steps!.map((step) {
                                    if (step.travelMode == TravelMode.WALKING) {
                                      return StepWidget(
                                        instructions: step.htmlInstructions!,
                                        color: Colors.grey.withOpacity(0.5),
                                      );
                                    } else if (step.travelMode ==
                                        TravelMode.TRANSIT) {
                                      return StepTransitWidget(
                                        instructions: step.htmlInstructions!,
                                        busName: step.transitDetails!.line!.name!,
                                        color: Colors.deepOrange,
                                      );
                                    }
                                    TextButton(
                                      style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange,
                                      ),
                                  ),
                                      onPressed: () { 
                                        Rutas();
                                      },
                                    child: Text('Ver detalle'),
                                    );
                                    return Text('--${step.htmlInstructions}');
                                  }).toList(),
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ],
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
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox (
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange, 
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      )
                ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    Key? key,
    required this.instructions,
    required this.color,
  }) : super(key: key);

  final String instructions;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 5,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.run_circle_outlined),
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
    required this.color,
    required this.busName,
  }) : super(key: key);

  final String busName;
  final String instructions;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 5,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.bus_alert),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  busName,
                  softWrap: true,
                ),
                Text(
                  instructions,
                  softWrap: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}