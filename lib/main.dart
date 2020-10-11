import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split_save/Login/LoginProcess.dart';
import 'package:flutter/services.dart';
import 'package:split_save/StartAppPages/StartPages.dart';
import './services/service_locator.dart';

void main() async {
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartingPages(),
    );
  }
}
