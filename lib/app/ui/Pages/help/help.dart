import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/help/transportes/transporte_omsa.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/profile/profile.dart';
import 'package:places_autocomplete/app/ui/Pages/help/transportes/transport._Metro_Tel.dart';
import '../home/home.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

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
            children: const [
               Text(
                'Ayuda',
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
          Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.phone_callback_sharp,
                      color: Colors.deepOrange,
                      size: 25,
                    ),
                    onPressed: () {
                      
                    },
                  ),
                  const Text(
                    'Números de Emergencia',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.deepOrange,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const TitleButton(
          title: 'Asistencia Vial', 
          subtitle: '(809) 565-2811 '
        ),
        const TitleButton(
          title: 'Emergencia', 
          subtitle: '911'
        ),
        const TitleButton(
          title: 'Intrant', 
          subtitle: '(809) 338-6134'
        ),
        const TitleButton(
          title: 'Digesett', 
          subtitle: '(809) 686-6520'
        ),
          const SizedBox(height: 10),
          Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.bus_alert,
                      color: Colors.deepOrange,
                      size: 25,
                    ),
                    onPressed: () {
                      
                    },
                  ),
                  const Text(
                    'Transportes',
                    style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.deepOrange,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TitleButton(
          title: "Metro y Teléferico", 
          subtitle: "L1, L2, L2B, T...'",
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => TransporteMetro()
              ),
            );
          },
        ),
        TitleButton(
          title: "OMSA", 
          subtitle: "Paradas corredor...",
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => TransporteOmsa()
              ),
            );
          },
        ),
          
        ]
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback? onPressed;
  const TitleButton(
    {Key? key, 
    required this.title, 
    required this.subtitle, 
    this.onPressed
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        onTap: onPressed,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
            Icons.chevron_right,
            color: onPressed != null ? Colors.black : Colors.transparent,
            size: 20,
            ),
      );
  }
}
