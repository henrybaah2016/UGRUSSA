import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/document_upload/all_files.dart';
import 'package:ugrussa/document_upload/upload.dart';
import 'package:ugrussa/home/home.dart';

import '../utils/utils.dart';
import '../widgets/progress_dialog.dart';

class NewsUpload extends StatefulWidget {
  static const routeName = "/news-upload";

  NewsUpload({Key? key}) : super(key: key);

  @override
  _NewsUploadState createState() => _NewsUploadState();
}

class _NewsUploadState extends State<NewsUpload> {
  TextEditingController _feedController = TextEditingController();

  FilePickerResult? result;
  List<File>? files;
  String? _fileUrl;

  List<String> fileNames = [];

  _uploadFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg','png'],
    );

    if (result != null) {
      files = result!.paths.map((path) {
        print("SINGLE FILE HERE $path");
        return File(path!);
      }).toList();

      _getFileName();
      print("LIST OF FILES $files");
    } else {
      // User canceled the picker
    }
  }

  _getFileName() {
    for (var file in files!) {
      setState(() {
        fileNames.add(file.path.split('/')[7]);
      });
    }
  }

  _removeFile(int index) {
    files!.removeWhere(
        (element) => element.path.split('/')[7] == fileNames[index]);
    setState(() {
      fileNames.removeAt(index);
    });

    print("FILE INDEX $index");
    print("FILES LEFT $files");
  }

  Future<void> _postFeed() async {
    if (fileNames.isEmpty) {
      return;
    }
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Please wait ... ",
      ),
    );
    // String fileName = path.basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('all_feeds_file/${fileNames[0]}');
    var uploadTask = firebaseStorageRef.putFile(files![0]);
    var taskSnapshot = await uploadTask.then(
      (taskSnapshot) {
        taskSnapshot.ref.getDownloadURL().then(
          (file) {
            print("Done: $file");
            setState(() {
              _fileUrl = file;
            });
            Map<String, dynamic> _feed = {
              "description": _feedController.text,
              "file": file,
              "user": currentFirebaseUser!.uid,
              "date": DateTime.now(),
            };

            FirebaseFirestore.instance.collection("feeds").add(_feed).then(
              (_) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            );

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => HomePage(),
            //   ),
            // );
          },
        );
// 1
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xff072e79),
                    size: 24.0,
                  ),
                ),
              );
            },
          ),
          title: const Text(
            'Upload Feed',
            style: TextStyle(
              color: Color(0xff072e79),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) async {
                if (result == 0) {
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Color(0xff072e79),
                size: 30.0,
              ),
              offset: Offset(0, kToolbarHeight),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 25),
                    child: Text(
                      'logout',
                      style: TextStyle(
                          color: Color(0xff3e3956),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  value: 0,
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Upload image or video',
                    style: TextStyle(
                      color: Color(0xff4C4C4C),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2, top: 5),
                  width: 35,
                  height: 18,
                  child: Center(
                    child: Text(
                      'Image',
                      style: TextStyle(
                        color: Color(0xff072e79),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0xffC3D0DD)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2, top: 5),
                  width: 35,
                  height: 18,
                  child: Center(
                    child: Text(
                      'Video',
                      style: TextStyle(
                        color: Color(0xfffbbc07),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0x2ffbbc07)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _uploadFile();
                    },
                    child:  Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: Colors.blue,
                              strokeWidth: 1,
                              radius: Radius.circular(4),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                    color: Color(0xffF4F9FE),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 150.0,
                                          width: 250.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Upload feed file here...',
                                                    style: TextStyle(
                                                      color: Color(0xc6000000),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Max files size: 50mb',
                                                  style: TextStyle(
                                                    color: Color(0xc6adadad),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  if (files != null)
                    ...fileNames.map((file) {
                      var index = fileNames.indexOf(file);
                      print("FILE INDEX $index");
                      return filePreviewWidget(
                        fileName: file.toString(),
                        removeFile: () => _removeFile(index),
                      );
                    }),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: _feedController,
                        keyboardType: TextInputType.text,
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
                          labelText: 'Feed Description',
                          labelStyle: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                          hintText: 'Feed Description',
                          hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 50, bottom: 50, left: 5, right: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff072e79),
                          minimumSize: Size(double.infinity, 52),
                        ),
                        onPressed: () {
                          print("FEED ${_feedController.text}");
                          _postFeed();
                        },
                        child: Text(
                          'Post Feed',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
