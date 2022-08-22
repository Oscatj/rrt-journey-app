import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';

class Agradecimiento extends StatelessWidget {
  const Agradecimiento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        child: ListView(
          children: [
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 200, 0, 20),
                  child: Icon(
                    Icons.check,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Center(
              child: Text(
                'RRT-JOURNEY',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  '¡Buen viaje!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Center(
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Home()
                        ),
                      );
                  },
                  child: const Text(
                      'Salir',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(128, 255, 255, 255),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ), 
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}