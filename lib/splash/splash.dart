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
    Timer(const Duration(seconds: 3000000000), () async {
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text("Introduced by the 2021/2022 "),
            Text("UGRUSSA Executives "),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Sponsored by :",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.003),
            Text("Firdaus Naana Issaka"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            Text(
              "(President, 2021/2022)",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Text(
              "Developers : ",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            Text("Intellisense Apps Limited."),
          ],
        ),
      ),
    );
  }
}
