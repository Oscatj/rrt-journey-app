import 'package:flutter/material.dart';
import '../home/home.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: (){
              Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => Home()
                    ),
                  );
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
            //mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon (
                  Icons.location_on,
                  color: Colors.deepOrange,
                ),
              ),
              const Text(
                'Ayuda',
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
    );
  }
}