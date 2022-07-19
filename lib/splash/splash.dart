import 'dart:async';

import "package:flutter/material.dart";
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/login/login.dart';
import 'package:ugrussa/utils/utils.dart';

class Splash extends StatefulWidget {

  bool? admin;
  Splash({Key? key, this.admin}) : super(key: key);

  static const routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  _navigateToHome() async {
    Timer(const Duration(seconds: 3), () async {
      final currentUser = await firebaseAuth.currentUser;

      if (currentUser != null) {
        currentFirebaseUser = firebaseAuth.currentUser;
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 140,
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
