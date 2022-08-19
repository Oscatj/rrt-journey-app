import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

import 'controller/controller_indication.dart';

class SearchAutocomplete extends StatefulWidget {

  @override
  _SearchAutocompleState createState() => _SearchAutocompleState();
}

class _SearchAutocompleState extends State<SearchAutocomplete> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column (
          children: [
            TextField(
              controller: _startController,
              autofocus: false,
              focusNode: startFocusNode,
              style: TextStyle(fontSize: 24),
              //showCursor: false,
              decoration: InputDecoration (
                hintText: 'Origen',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 24),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                suffixIcon: _startController.text.isNotEmpty
                  ? IconButton(
                    onPressed: (){
                      setState(() {
                        predictions = [];
                          _startController.clear();
                      });
                    },
                      icon: Icon (
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
            SizedBox(height: 10),
            TextField(
              controller: _endController,
              autofocus: false,
              focusNode: endFocusNode,
              enabled: _startController.text.isNotEmpty && startPosition != null,
              //showCursor: false,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration (
                hintText: 'Destino',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 24),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                suffixIcon: _endController.text.isNotEmpty
                  ? IconButton(
                    onPressed: (){
                      setState(() {
                        predictions = [];
                          _endController.clear();
                      });
                    },
                      icon: Icon (
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                  ),),
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
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
