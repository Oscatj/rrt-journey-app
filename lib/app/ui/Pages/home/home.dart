import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:places_autocomplete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:places_autocomplete/app/ui/global_controller/session_controller.dart';

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
            Consumer(
              builder: (_, watch, __) {
                final user = watch(sessionProvider).user!;
                return Text(user.displayName ?? '');
              }
            ),
            Text("Home Page"),
            SizedBox(height: 20),
            CupertinoButton(
              child: Text("Salir"), 
              onPressed: () async {
                await sessionProvider.read.SignOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              }
              )
          ],
        ),
        

        ),
    );
  }
}