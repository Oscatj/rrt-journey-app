import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;

import '../../Routes/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Home Page"),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text("Salir"), 
              onPressed: () async {
                await Get.i.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              }
              )
          ],
        ),
        

        ),
    );
  }
}