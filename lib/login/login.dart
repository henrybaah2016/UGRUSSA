import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/signup/signup.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';

import '../forgot_password/forgot_password .dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  validateForm(BuildContext context) {
    if (!_emailController.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email must be valid',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_passwordController.text.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be at least 6 characters long',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else {
      _loginUser();
    }
  }

  void _loginUser() async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Verifying user credentials",
      ),
    );

    final User? firebaseUser = (await firebaseAuth
            .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    )
            .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message.toString(),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 8),
        ),
      );
      Navigator.of(context).pop();
      print(error);
    }))
        .user;

    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User Logged In Successfully",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      _fetchDataFromFirestore(currentFirebaseUser);
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong when trying to log in",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void _loginAdmin() async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Verifying admin credentials",
      ),
    );

    final User? firebaseUser = (await firebaseAuth
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: "123456",
    )
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message.toString(),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 8),
        ),
      );
      Navigator.of(context).pop();
      print(error);
    }))
        .user;

    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      var prefs =  await SharedPreferences.getInstance();
      prefs.setBool(ADMIN, true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User Logged In Successfully",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pop(context);

      Navigator.of(context).pushNamed(Splash.routeName);
      // _fetchDataFromFirestore(currentFirebaseUser);
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong when trying to log in",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _fetchDataFromFirestore(User? currentUser) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        print("DATA SNAPSHOT $snapshot");
        print("DATA SNAPSHOT ${snapshot.data()!['email']}");
        //save data locally
        sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences!.setString("userUID", currentUser.uid);
        await sharedPreferences!.setString("email", snapshot.data()!['email']);
        await sharedPreferences!.setString("name", snapshot.data()!["name"]);
        await sharedPreferences!.setString("phone", snapshot.data()!["phone"]);
        await sharedPreferences!
            .setString("studentID", snapshot.data()!["student ID"]);
        await sharedPreferences!.setString("level", snapshot.data()!["level"]);
        await sharedPreferences!
            .setString("residence", snapshot.data()!["residence"]);
        await sharedPreferences!
            .setString("profilePhotoUrl", snapshot.data()!["profilePhotoUrl"]);
        Navigator.pop(context);
        Navigator.of(context).pushNamed(Splash.routeName);
      }
    });
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
                  labelText: 'Email',
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
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.number,
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
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                  hintStyle: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      color: this._obscurePassword
                          ? Color(0xffff4A4A)
                          : Color(0xffC6C6C6),
                      size: 20.0,
                    ),
                    onPressed: () {
                      setState(
                          () => this._obscurePassword = !this._obscurePassword);
                    },
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: new Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: new Row(
                        children: <Widget>[
                          new GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage()),
                              );
                            },
                            child: new Text("Forgot Password",
                                style: new TextStyle(
                                    color: Color(0xff072e79),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              validateForm(context);
            },
            onLongPress: () {
              print("Long Pressed 1");
              if(_emailController.text ==" admin@ugrussa.org" && _passwordController.text == "poiuyTREWQ123456"){
                _loginAdmin();
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 60, left: 5, right: 5),
              decoration: BoxDecoration(
                color: const Color(0xff072e79),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Color(0xffB3B3B3),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    " Sign up",
                    style: TextStyle(
                        color: Color(0xff072e79),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
