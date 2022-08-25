import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:places_autocomplete/app/domain/models/journey.dart';
import 'package:places_autocomplete/app/domain/response/journey_response.dart';
import 'package:places_autocomplete/app/ui/Pages/help/help.dart';
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/home/widgets/build_Journey_home.dart';
import 'package:places_autocomplete/app/ui/Pages/my_routes/my_routes.dart';
import 'package:places_autocomplete/app/ui/Pages/profile/profile.dart';
import 'package:places_autocomplete/app/ui/Pages/record/record.dart';
import 'package:places_autocomplete/app/ui/Pages/rutas/search_autocomplete.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final iconColor = isDark ? Colors.white: Colors.deepOrange;
    final textColor = isDark ? Colors.grey: Color.fromARGB(255, 99, 99, 99);
    final buttonColor = isDark ? Colors.white: Colors.grey.shade300;
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
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon (
                  Icons.location_on,
                  color: Colors.deepOrange
                ),
              ),
              const Text(
                'RRT-JOURNEY',
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
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: ListView(            
          children: [
            Padding(
              padding: EdgeInsets.all(1)
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(2.0,2.0),
                        spreadRadius: 2.0
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/1.png'),
                      fit: BoxFit.cover,

                    )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(2.0,2.0),
                        spreadRadius: 2.0
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/2.png'),
                      fit: BoxFit.cover,
                      
                    )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(2.0,2.0),
                        spreadRadius: 2.0
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/3.png'),
                      fit: BoxFit.cover,
                      
                    )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    ),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3.0,
                        offset: Offset(2.0,2.0),
                        spreadRadius: 2.0
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/4.png'),
                      fit: BoxFit.cover,
                      
                    )
                  ),
                )
              ], 
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
                scrollDirection: Axis.horizontal
              )
            ),
            SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: buttonColor,
                        shape: StadiumBorder(),
                        elevation: 0,
                        padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                        child: Text(
                          '¿A dónde vamos?',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> SearchAutocomplete())
                          );
                        },
                      ),
                    ],
                  ),  
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal:30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 60,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> Record())
                          );
                          },
                          child: Text(
                            'Historial',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal:30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.apartment,
                          color: Colors.white,
                          size: 60,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> MyRoutes())
                          );
                          },
                          child: Text(
                            'Mis Rutas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal:30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 60,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> Profile())
                          );
                          },
                          child: Text(
                            'Perfil',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal:30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.help_sharp,
                          color: Colors.white,
                          size: 60,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> Help())
                          );
                          },
                          child: Text(
                            'Ayuda',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ], 
        ),
      )
    );
  }
}

