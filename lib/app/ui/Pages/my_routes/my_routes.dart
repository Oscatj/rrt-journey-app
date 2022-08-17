import 'package:flutter/material.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis rutas'),
      ),
      body: Container(
      color: Colors.white,
      child: Text ('Mis rutas'),
      )
    );
  }
}