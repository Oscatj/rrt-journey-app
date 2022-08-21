import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:places_autocomplete/services/directions.repository.dart';
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
          children: [
            const Text(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
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
                                  fontWeight: FontWeight.w500)),
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
                                        return StepTransitWidget(
                                          instructions: step.htmlInstructions!,
                                          busName:
                                              step.transitDetails!.line!.name!,
                                          color: Colors.deepOrange,
                                        );
                                      }
                                      return Text('--${step.htmlInstructions}');
                                    }).toList(),
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
                                        onPressed: () {},
                                        child: const Text('Ver detalle')
                                      ),
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
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey,
                      )),
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
        const Padding(
          padding: EdgeInsets.all(8.0),
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
        const Padding(
          padding: EdgeInsets.all(8.0),
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