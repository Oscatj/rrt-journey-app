import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/domain/models/journey.dart';
import 'package:places_autocomplete/app/domain/response/firestore_services.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/record/widgets/buid_widget_record.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }, 
            icon: const Icon(
              Icons.menu,
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
                'Historial',
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
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: StreamBuilder<List<Journey>>(
          stream: readJourneys(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return const Text('Algo salió mal');
            }else if(snapshot.hasData){
              final journeys = snapshot.data!;
              return ListView( 
                children: journeys.map(buidJourneyRecord).toList(),
              );
            }else {
              return const Center(
                child: CircularProgressIndicator()
              );
            }
          },
        ),
      ),
      
    );
  }
}