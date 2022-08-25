import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/journey.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:intl/intl.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/form_saved_router.dart';
import '../../../domain/response/journey_response.dart';
import 'controller/controller_indication.dart';

class SearchAutocomplete extends StatefulWidget {
  const SearchAutocomplete({Key? key}) : super(key: key);

  @override
  State<SearchAutocomplete> createState() => _SearchAutocompleteState();
}

class _SearchAutocompleteState extends State<SearchAutocomplete> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746
  );

  DetailsResult? startPosition;
  DetailsResult? endPosition;

  late FocusNode startFocusNode;
  late FocusNode endFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  Timer? _debounce;

  @override
  void initState(){
    super.initState();
    String apiKey = 'AIzaSyC8riEeFf60iRu2T8O-fd6AIfGfJdxCFkA';
    googlePlace = GooglePlace(apiKey);

    startFocusNode = FocusNode();
    endFocusNode = FocusNode();
  }

  @override
  void disponse() {
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
  }

  void autoCompleteSearch (String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if(result != null && result.predictions != null && mounted){
      //print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

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
      ),
      body: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 350,
                                  height: 60,             
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                      child: TextField(
                                        controller: _startController,
                                        autofocus: false,
                                        focusNode: startFocusNode,
                                        style: const TextStyle(fontSize: 20),
                                        //showCursor: false,
                                        
                                        decoration: InputDecoration (
                                          border: InputBorder.none,
                                          hintText: "Origen",
                                          hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500, fontSize: 20),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          suffixIcon: _startController.text.isNotEmpty
                                            ? IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  predictions = [];
                                                    _startController.clear();
                                                });
                                              },
                                                icon: const Icon (
                                                  Icons.clear_outlined, 
                                                  color: Colors.deepOrange,)
                                              )
                                            : null),
                                          onChanged: (value) {
                                            if(_debounce?.isActive ?? false) _debounce!.cancel();
                                            _debounce = Timer(const Duration(milliseconds: 1000), (){
                                              if(value.isNotEmpty) {
                                            autoCompleteSearch(value);
                                              }
                                              else{
                                                setState(() {
                                                  predictions = [];
                                                  startPosition = null;
                                                });
                                              }
                                            });
                                          },
                                      ),
                                    ),
                                  ),
                                  Container(
                                  width: 350,
                                  height: 60,             
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                      child: TextField(
                                        controller: _endController,
                                        autofocus: false,
                                        focusNode: endFocusNode,
                                        enabled: _startController.text.isNotEmpty && startPosition != null,
                                        //showCursor: false,
                                        style: const TextStyle(fontSize: 20),
                                        decoration: InputDecoration (
                                          border: InputBorder.none,
                                          hintText: "Destino",
                                          hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500, fontSize: 20),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          suffixIcon: _endController.text.isNotEmpty
                                            ? IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  predictions = [];
                                                    _endController.clear();
                                                });
                                              },
                                                icon: const Icon (
                                                  Icons.clear_outlined, 
                                                  color: Colors.deepOrange
                                                ),
                                              )
                                            : null
                                          ),
                                          onChanged: (value) {
                                            if(_debounce?.isActive ?? false) _debounce!.cancel();
                                            _debounce = Timer(const Duration(milliseconds: 1000), (){
                                              if(value.isNotEmpty) {
                                                autoCompleteSearch(value);
                                              }
                                              else{
                                                setState(() {
                                                  predictions = [];
                                                  endPosition = null;
                                                });
                                              }
                                            });
                                          },
                                      ),                               
                                    ),
                                  ),
                                  
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListView.builder(
                shrinkWrap: true,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                        Icons.location_on,
                        color: Colors.deepOrange,
                        size: 30,

                    ),
                    title: Text(predictions[index].description.toString()),
                    onTap: () async {
                      final placeId = predictions[index].placeId!;
                      final details = await googlePlace.details.get(placeId);
                      if(details != null && details.result != null && mounted){
                        if(startFocusNode.hasFocus){
                          setState(() {
                            startPosition = details.result;
                            _startController.text = details.result!.name!;
                            predictions = [];
                          });
                        }
                        else {
                          setState(() {
                            endPosition = details.result;
                            _endController.text = details.result!.name!;
                            predictions = [];
                          });
                        }
                        if (startPosition != null && endPosition != null){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ControllerIndication(
                                startPosition: startPosition,
                                endPosition: endPosition,
                              )),
                            );
                        }
                      }
                      final origen = _startController.text;
                      final destino = _endController.text;
                      final DateTime now = DateTime.now();
                      final DateFormat formatter =DateFormat('dd/MM/yy hh:mm');
                      final String formatted = formatter.format(now);
                      createJourney(origen: origen, destino: destino, fecha: formatted);
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.favorite,
                        color: Colors.deepOrange,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => SavedRouter()
                            ),
                          );
                        }, 
                        child: Text(
                          'Guardar esta ruta',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              )
              ],
      )
    );
  }
}