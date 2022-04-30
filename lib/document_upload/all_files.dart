import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/home/home.dart';

class AllFiles extends StatefulWidget {
  AllFiles({Key? key}) : super(key: key);

  @override
  _AllFilesState createState() => _AllFilesState();
}

class _AllFilesState extends State<AllFiles> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xff072e79),
                  size: 24.0,
                ),
              );
            },
          ),
          title: const Text('All Files',style: TextStyle(color: Color(0xff072e79), fontSize: 20, fontWeight: FontWeight.w500,),),

          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) async {
                if(result == 0){
                  Navigator.of(context).pop();
                }

              },

              icon:const Icon(

                Icons.more_vert_rounded,
                color: Color(0xff072e79),
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
          child: Column(
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right:10,top:10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xA3ECECEC),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/images/pdf_icon.png')),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Academic Calendar',
                                                      style: TextStyle(
                                                          color: Color(0xff575858),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Size: 154kb',
                                                      style: TextStyle(
                                                          color: Color(0xffc8cbcd),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.file_open_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),
                                            Padding(
                                              padding: const EdgeInsets.only(right:10),
                                              child:  Icon(
                                                Icons.clear_outlined,
                                                color: Color(0xFFB6B6B6),
                                                size: 18.0,
                                              ),
                                            ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right:10,top:10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xA3ECECEC),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/images/pdf_icon.png')),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Academic Calendar',
                                                      style: TextStyle(
                                                          color: Color(0xff575858),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Size: 154kb',
                                                      style: TextStyle(
                                                          color: Color(0xffc8cbcd),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.file_open_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.clear_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right:10,top:10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xA3ECECEC),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/images/pdf_icon.png')),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Academic Calendar',
                                                      style: TextStyle(
                                                          color: Color(0xff575858),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Size: 154kb',
                                                      style: TextStyle(
                                                          color: Color(0xffc8cbcd),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.file_open_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.clear_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right:10,top:10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xA3ECECEC),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/images/pdf_icon.png')),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Academic Calendar',
                                                      style: TextStyle(
                                                          color: Color(0xff575858),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Size: 154kb',
                                                      style: TextStyle(
                                                          color: Color(0xffc8cbcd),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.file_open_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.clear_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10,right:10,top:10),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xA3ECECEC),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      'assets/images/pdf_icon.png')),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5, left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Academic Calendar',
                                                      style: TextStyle(
                                                          color: Color(0xff575858),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Text(
                                                      'Size: 154kb',
                                                      style: TextStyle(
                                                          color: Color(0xffc8cbcd),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.file_open_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child:  Icon(
                                              Icons.clear_outlined,
                                              color: Color(0xFFB6B6B6),
                                              size: 18.0,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ]
          ),
        )
    );
  }
}