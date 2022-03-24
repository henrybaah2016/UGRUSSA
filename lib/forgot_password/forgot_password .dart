import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/signup/signup.dart';
import 'package:ugrussa/splash/splash.dart';

import '../main.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),

          child:Center(
            child: Column(

              children: <Widget>[
               Center(
                 child:Container(
                   margin: const EdgeInsets.only(top: 80, left: 5, bottom:5),
                   height:70,
                    width:70,
                    child:Image.asset('assets/images/logo.png'),
                 )
               ),
                Container(
                  margin: const EdgeInsets.only(top: 0, left: 5, bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Text(
                      'UGRUSSA',
                      style: TextStyle(color: Color(0xff072e79), fontSize: 32, fontWeight: FontWeight.w600, ),
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
                        "Reset password by entering the new password",
                        style: TextStyle(color: Color(0xffB3B3B3), fontSize: 12,fontWeight: FontWeight.w700),
                      ),

                    ],
                  ),
                ),


                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffB3B3B3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff000000)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffB3B3B3)),

                        ),
                        labelText: 'New Password',
                        labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0,left:10),
                        hintText: 'New Password', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600),

                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Color(0xffff4A4A) : Color(0xffC6C6C6),
                            size: 20.0,

                          ), onPressed: () {
                          setState(() => this._showPassword = !this._showPassword);

                        },
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffB3B3B3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xff000000)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffB3B3B3)),

                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0,left:10),
                        hintText: 'Confirm Password', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600),

                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Color(0xffff4A4A) : Color(0xffC6C6C6),
                            size: 20.0,

                          ), onPressed: () {
                          setState(() => this._showPassword = !this._showPassword);

                        },
                        ),
                      ),
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top: 60,left:5,right:5),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text('Reset',style: TextStyle(color: Color(0xffffffff), fontSize: 14, fontWeight: FontWeight.w700,),),
                  ),
                ),
              ],
            )
          ),
        )
    );


  }
}