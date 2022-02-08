import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugrussa/splash/splash.dart';

void main(){
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' University of Ghana Russia Student Association App',
      theme: ThemeData(
        //fontFamily: 'SanFrancisco',

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
