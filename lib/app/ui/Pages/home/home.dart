import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/Pages/home/nav_bar.dart';
import 'package:places_autocomplete/app/ui/Pages/home/tabs/first_tab.dart';
import 'package:places_autocomplete/app/ui/Pages/home/tabs/second_tab.dart';
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

import '../../Routes/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(
      ),
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
              IconButton(
                onPressed: () {},
                icon: const Icon (
                  Icons.location_on,
                  color: Colors.deepOrange,
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
          SizedBox(width: 18),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: (
          Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.bus_alert,
                      color: Colors.deepOrange,
                    ),
                  )
                ]
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FirstTab(),
                    SecondTab()
                  ]
                )
              )
            ]         
          )
        ),
      ),
    );
  }
}