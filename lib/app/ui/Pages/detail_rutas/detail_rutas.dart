import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/facturacion/facturacion.dart';

class DetailRutas extends StatelessWidget {
  const DetailRutas({Key? key}) : super(key: key);

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
          children: const [
            Text(
             'Detalle de ruta',
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
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Image.asset('assets/bus.jpg'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Ruta 1",
                      style: TextStyle(
                        leadingDistribution: TextLeadingDistribution.proportional,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 118, 118, 118)
                      ),
                    ),
                    SizedBox(width: 240),
                    Text(
                      "40min",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 70, 70, 70)
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      "Direcciones del viaje...",
                      style: TextStyle(
                        leadingDistribution: TextLeadingDistribution.proportional,
                        fontSize: 18,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(width: 70),
                    Text(
                      "Precio: 95",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}