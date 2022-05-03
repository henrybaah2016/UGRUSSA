import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/signup/signup.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';

import '../main.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _obscurePassword = true;

  var _emailController = TextEditingController();

  _sendResetLink() {
    showDialog(
        context: context,
        builder: (context) => ProgressDialog(message: "Sending Email..."));

    firebaseAuth
        .sendPasswordResetEmail(email: _emailController.text)
        .then((value) {
      Navigator.of(context).pushNamed(Splash.routeName);
    }).catchError(
      (error) {
        showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
            title: const Text("Something went wrong"),
            content: const Text(
              "Email not found. Please try again.",
            ),
            actions: <Widget>[
              MaterialButton(
                  child: const Text("Okay"),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  textColor: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ); //Navigator.p
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Center(
          child: Column(
        children: <Widget>[
          Center(
              child: Container(
            margin: const EdgeInsets.only(top: 80, left: 5, bottom: 5),
            height: 70,
            width: 70,
            child: Image.asset('assets/images/logo.png'),
          )),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 5, bottom: 40),
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                'UGRUSSA',
                style: TextStyle(
                  color: Color(0xff072e79),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Enter your email address below and ",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color(0xffB3B3B3),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                  ),

                ),
                Text(
                  "we will send you a link to reset your password",
                  style: TextStyle(
                      color: Color(0xffB3B3B3),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffB3B3B3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffB3B3B3)),
                  ),
                  labelText: 'Enter your email here',
                  labelStyle: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                  hintStyle: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 5, right: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff072e79),
                minimumSize: Size(double.infinity, 52),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: Color(0xff072e79)),
                ),
              ),
              onPressed: () {
                _sendResetLink();
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
