import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab4/screens/login_screen.dart';

import 'screens/dash_board.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //<------------------ orientation setting ------------------
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  //<------------------ orientation setting ------------------

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
       home: LoginScreen()));
  // home: FirstTab2()));
}
