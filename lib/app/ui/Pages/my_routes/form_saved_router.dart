import 'package:flutter/material.dart';

class SavedRouter extends StatelessWidget {
  const SavedRouter({Key? key}) : super(key: key);

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
             'Rutas personalizadas',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(height:50),
                    (
                      Text(
                        'Nombre de la ruta:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18
                        ),
                      )
                    ),
                  ],
                ),
                (
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration (
                    border: InputBorder.none,
                    hintText: "Ejemplo: Casa",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),
                      filled: true,
                      fillColor: Colors.grey[200],
                  )
                )
                ),
                (
                  SizedBox(height:20)
                ),
                Row(
                  children: [
                    (
                      Text(
                        'Origen:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18
                        ),
                      )
                    ),
                  ],
                ),
                (
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration (
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                      filled: true,
                      fillColor: Colors.grey[200],
                  )
                )
                ),
                (
                  SizedBox(height:20)
                ),
                Row(
                  children: [
                    (
                      Text(
                        'Destino:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18
                        ),
                      )
                    ),
                  ],
                ),
                (
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration (
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                      filled: true,
                      fillColor: Colors.grey[200],
                  )
                )
                ),
                (
                  SizedBox(height:20)
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.deepOrange,
                  ),
                  child: (
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
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                          )
                        )
                  ),
                )
              ],
              
            ),
            
          )
        ),
      );
  }
}