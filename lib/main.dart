import 'package:flutter/material.dart';
import 'package:places_autocomplete/app/inject_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependencies();
  runApp(const MyApp());
}
