import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:multi_wizard/multi_wizard.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/student/details.dart';
import 'package:ugrussa/student/join.dart';

class PayPage extends StatefulWidget {
  PayPage({Key? key}) : super(key: key);

  static const routeName = "/list";

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _value = true;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xff072e79),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xffffffff),
                  size: 24.0,
                ),
              );
            },
          ),
          title: const Text('Dues Payment',style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.normal,),),

          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) async {
                if(result == 0){
                  Navigator.of(context).pop();
                }

              },

              icon:const Icon(

                Icons.more_vert_rounded,
                color: Color(0xffffffff),
                size: 30.0,


              ),
              offset: Offset(0, kToolbarHeight),

              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child:Padding(
                    padding: EdgeInsets.only(left:8.0,right: 25),
                    child: Text('logout',style: TextStyle(color: Color(0xff3e3956), fontSize: 20,fontWeight: FontWeight.w400),),
                  ),
                  value: 0,
                ),

              ],
            ),
          ],
        ),

        body: SingleChildScrollView(
          child:Center(
            child: Container(
              margin:EdgeInsets.only(bottom: 40),

              child: SizedBox(
                width: 500,
                height: 500,
                child: MultiWizard(
                  steps: [
                    WizardStep(
                      showPrevious: false, // Removes the previous button
                      nextFunction: () => print('You pressed the next button'),
                      child: Center(
                        child: Form(
                          key: _key,
                          child:Container(
                              margin: const EdgeInsets.only(left: 5,right:5, bottom:5,top:10),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right:15,left:15,bottom:20),
                                    child: Text(
                                      'Student Information',
                                      style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right:10,left:10),

                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'Full Name',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Full Name', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.emailAddress,
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
                                                  labelText: 'Level',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Level', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'Student ID',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Student ID', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                    WizardStep(
                      child: Center(
                        child: Form(
                          key: _key,
                          child: Container(
                            margin: const EdgeInsets.only(left: 5,right:5, bottom:5,top:20),

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:5.0,right:4,left:10,bottom:20),
                                  child: Text(
                                    'Select payment method',
                                    style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
                                  ),
                                ),
                                ListTile(
                                  title: Text('Mobile Money'),
                                  leading: Radio(
                                    value: 1,
                                    groupValue: val,

                                    activeColor: Colors.green, onChanged: (int? value) {  },
                                  ),
                                ),
                                ListTile(
                                  title: Text('VISA'),
                                  leading: Radio(
                                    value: 1,
                                    groupValue: val,

                                    activeColor: Colors.green, onChanged: (int? value) {  },
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    WizardStep(
                      showPrevious: false, // Removes the previous button
                      nextFunction: () => print('You pressed the next button'),
                      child: Center(
                        child: Form(
                          key: _key,
                          child:Container(
                              margin: const EdgeInsets.only(left: 5,right:5, bottom:5,top:10),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right:15,left:15,bottom:20),
                                    child: Text(
                                      'Card Information',
                                      style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right:10,left:10),

                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'Card Name',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Card Name', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.emailAddress,
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
                                                  labelText: 'Card Number',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Card Number', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'Card Expiry',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Card Expiry', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.emailAddress,
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
                                                  labelText: 'Amount',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Amount', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                        ),
                      ),
                    ),

                    WizardStep(
                      showPrevious: false, // Removes the previous button
                      nextFunction: () => print('You pressed the next button'),
                      child: Center(
                        child: Form(
                          key: _key,
                          child:Container(
                              margin: const EdgeInsets.only(left: 5,right:5, bottom:5,top:10),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right:15,left:15,bottom:20),
                                    child: Text(
                                      'Mobile Money Information',
                                      style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right:10,left:10),

                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'Full name',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Full Name', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.text,
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
                                                  labelText: 'MoMo Number',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Momo Number', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: const EdgeInsets.only(bottom: 25),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: TextField(
                                              keyboardType: TextInputType.emailAddress,
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
                                                  labelText: 'Amount',
                                                  labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                                  contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                                  hintText: 'Amount', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                  finishFunction: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Payment processing'),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                ),
              ),
            ),
          ),
        )
    );
  }
}
