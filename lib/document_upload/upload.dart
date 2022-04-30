import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/document_upload/all_files.dart';
import 'package:ugrussa/home/home.dart';

class Upload extends StatefulWidget {
  Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

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
          title: const Text('Files Manager',style: TextStyle(color: Color(0xff072e79), fontSize: 20, fontWeight: FontWeight.w500,),),

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
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 50,bottom:10),
                  child: Text(
                    'Upload Files',
                    style: TextStyle(color: Color(0xff000000), fontSize: 20, fontWeight: FontWeight.w700, ),
                  ),
                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,right:10),
                      child: Text(
                        'Upload files to share',
                        style: TextStyle(color: Color(0xff4C4C4C), fontSize: 14, fontWeight: FontWeight.w600, ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right:2,top:5),
                      width: 35,
                      height: 18,

                      child: Center(
                        child: Text(
                          'PDF',
                          style: TextStyle(color: Color(0xff072e79), fontSize: 10, fontWeight: FontWeight.w600, ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffC3D0DD)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right:2,top:5),
                      width: 35,
                      height: 18,

                      child: Center(
                        child: Text(
                          'DOCX',
                          style: TextStyle(color: Color(0xfffbbc07), fontSize: 10, fontWeight: FontWeight.w600, ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0x2ffbbc07)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right:2,top:5),
                      width: 35,
                      height: 18,

                      child: Center(
                        child: Text(
                          'PNG',
                          style: TextStyle(color: Color(0xffef6588), fontSize: 10, fontWeight: FontWeight.w600, ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0x3bef6588)),
                    ),

                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.blue,
                          strokeWidth: 1,
                          radius: Radius.circular(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                                color: Color(0xffF4F9FE),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150.0,
                                      width: 250.0,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Icon(
                                              Icons.folder,
                                              color: Color(0xff7b8b9a),
                                              size: 40.0,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 5,bottom:5),
                                              child: Text(
                                                'Choose files here...',
                                                style: TextStyle(color: Color(
                                                    0xc6000000), fontSize: 18, fontWeight: FontWeight.w500, ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Max files size: 50mb',
                                              style: TextStyle(color: Color(
                                                  0xc6adadad), fontSize: 14, fontWeight: FontWeight.w500, ),
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
                        ),
                      ),
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
                        ),
                      ),

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
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 50,bottom: 50,left: 5,right: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff072e79),
                              minimumSize: Size(double.infinity, 52),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AllFiles()),
                              );
                            },
                            child: Text('Save Files',style: TextStyle(color: Color(0xffffffff), fontSize: 14, fontWeight: FontWeight.w700,)
                            ),
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