

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_wizard/multi_wizard.dart';

class JoinPage extends StatefulWidget {
  JoinPage({Key? key}) : super(key: key);

  static const routeName = '/join';

  @override
  _JoinPageState createState() => _JoinPageState();
}


class _JoinPageState extends State<JoinPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isChecked = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    String name = "";

    return Scaffold(
      backgroundColor: Color (0xffffffff),
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
        title: const Text('Kaha Mane',style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.normal,),),

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

      body: Center(
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
                              padding: const EdgeInsets.only(top:5.0,right:4,left:0,bottom:20),
                              child: Text(
                                'General Information',
                                style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
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
                                      labelText: 'Student Email',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Student Email', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
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
                                      labelText: 'Residence',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Residence', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
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
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Gender', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
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
                                      labelText: 'Date of Birth',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Date of Birth', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                  ),
                                ),
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
                              padding: const EdgeInsets.only(top:5.0,right:4,left:0,bottom:20),
                              child: Text(
                                'Student Information',
                                style: TextStyle(color: Color(0xff4b4b4b), fontSize: 18, fontWeight: FontWeight.w600, ),
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
                                      labelText: 'Year',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Year', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
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
                                      labelText: 'Academic Programme',
                                      labelStyle: TextStyle(color: Color(0xff000000),fontSize: 12, fontWeight: FontWeight.w600),
                                      contentPadding: EdgeInsets.only(bottom: 0,left:10),
                                      hintText: 'Residence', hintStyle: TextStyle(color: Color(0xff000000),fontSize: 16, fontWeight: FontWeight.w600)
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
              finishFunction: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('You have joined the UGRUSSA!'),
                    duration: Duration(seconds: 5),
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}



