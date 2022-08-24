import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/ui/Pages/request_permission/request_permission_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermission extends StatefulWidget {
  RequestPermission({Key? key}) : super(key: key);

  @override
  State<RequestPermission> createState() => _RequestPermissionState();
}

class _RequestPermissionState extends State<RequestPermission> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);

  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
     _subscription = _controller.onStateChanged.listen(
     (status) {
        if(status == PermissionStatus.granted){
          
        }
      }
    );
  }
  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
        )
      )
    );
  }
}