import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';
import 'package:places_autocomplete/services/directions.repository.dart';
import 'package:places_autocomplete/services/directions_service.dart';

import '../rutas.dart';
import '../utils/map.utils.dart';

class ControllerIndication extends StatefulWidget {
  final DetailsResult? startPosition;
  final DetailsResult? endPosition;

  const ControllerIndication ({super.key, this.startPosition, this.endPosition});
  @override
  State<ControllerIndication> createState() => ControllerIndicationState();
}

class ControllerIndicationState extends State<ControllerIndication> {

  late CameraPosition _initialPosition;
  final Completer<GoogleMapController> _comtroller = Completer();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  var service = DirectionsRepository();

  @override
  void initState(){
    super.initState();
    
    _initialPosition = CameraPosition(
      target: LatLng(
        widget.startPosition!.geometry!.location!.lat!,
        widget.startPosition!.geometry!.location!.lng!
      ),
      zoom: 14.4746
      );
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, 
        color: Colors.deepOrange, 
        points: polylineCoordinates,
        width: 3);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyC8riEeFf60iRu2T8O-fd6AIfGfJdxCFkA',
        PointLatLng(
          widget.startPosition!.geometry!.location!.lat!,
          widget.startPosition!.geometry!.location!.lng!),
        PointLatLng(
          widget.endPosition!.geometry!.location!.lat!,
          widget.endPosition!.geometry!.location!.lng!),
        travelMode: TravelMode.driving,
        );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = {
      Marker(
        markerId: MarkerId('start'),
        position: LatLng(
        widget.startPosition!.geometry!.location!.lat!,
        widget.startPosition!.geometry!.location!.lng!
      ),
      ),
      Marker(
        markerId: MarkerId('end'),
        position: LatLng(
        widget.endPosition!.geometry!.location!.lat!,
        widget.endPosition!.geometry!.location!.lng!
      ),
      )
    };
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            ),
        ),
      ),
       body: Stack(
         children: [
          LayoutBuilder(
            builder:(BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight / 1.1,
                child: GoogleMap(
                  polylines: Set<Polyline>.of(polylines.values),
                  initialCameraPosition: _initialPosition,
                  markers: Set.from(_markers),
                  onMapCreated: (GoogleMapController controller) {
                                Future.delayed(
                                    Duration(milliseconds: 2000),
                                    () { controller.animateCamera(
                                        CameraUpdate.newLatLngBounds(
                                            MapUtils.boundsFromLatLngList(
                                                _markers.map((loc) => loc.position).toList()),
                                            1
                                          )
                                        );
                                      _getPolyline();
                                      }
                                  );
                          },
                     ),
              );
            }
          ),
         DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          builder:(BuildContext context, ScrollController scrollerController)
          {
            return Container(
              color: Colors.deepOrange,
              //border: BorderRadius.circular(3),
              child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Rutas())
                          ),
                      );
                    },
                    child: Text('Buscar rutas', style: TextStyle(fontSize: 26)),
                  )
            );
          })
       ]),
    );
  }
}

