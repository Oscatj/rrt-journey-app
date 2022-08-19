import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/home/home.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);
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
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '11:40am',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                        )  
                                      ),
                                      const Text(
                                        'Lunes',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                      const Text(
                                        '7/06/2022',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 16,
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 240,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          '\$45.00',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'B: Mamá Tingo-ipódromo',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Text(
                                          'L1: Centro de los Héroes',
                                          style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
