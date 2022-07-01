import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ugrussa/home/home.dart';

class AllFiles extends StatefulWidget {
  final String? file;

  AllFiles({Key? key, this.file}) : super(key: key);

  @override
  _AllFilesState createState() => _AllFilesState();
}

class _AllFilesState extends State<AllFiles> {
  var _items = [];
  List<dynamic> _fileNames = [];
  bool _isDownloading = false;

  var _isLoading = false;
  String downloadUrl = "";

  @override
  void initState() {
    super.initState();
    fetchAllFiles();
  }

  Future<void> downloadFileExample(String file) async {
    //First you get the documents folder location on the device...
    Directory appDocDir = await getApplicationDocumentsDirectory();
    //Here you'll specify the file it should be saved as
    File downloadToFile = File('${appDocDir.path}/$file');
    //Here you'll specify the file it should download from Cloud Storage
    String fileToDownload = 'uploads/$file';

    //Now you can try to download the specified file, and write it to the downloadToFile.
    try {
      setState(() {
        _isDownloading = true;
      });
      await FirebaseStorage.instance
          .ref(fileToDownload)
          .writeToFile(downloadToFile)
          .then((_) {
        setState(() {
          _isDownloading = false;
        });

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("File downloaded successfully"),
          ),
        );
      });

      await downloadToFile.create();
      await OpenFile.open(downloadToFile.path);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('Download error: $e');
    }
  }

  void fetchAllFiles() async {
    setState(() {
      _isLoading = true;
    });
    final storageRef = FirebaseStorage.instance.ref().child("uploads/");
    await storageRef.listAll().then((listResult) async {
      // print("ALL FILES ${listResult.storage.ref()}");
      for (var item in listResult.items) {
        _items.add(item);
        print("SINGLE FILES ${item.fullPath.split('/')[1]}");
        var _filePath = item.fullPath.split('/')[1];
        _fileNames.add(_filePath);
        print("FILE PATH ${item.fullPath}");
        await storageRef
            .child("/" + _filePath)
            .getDownloadURL()
            .then((downloadUrl) {
          setState(() {
            _isLoading = false;
          });
          print("FILE DOWNLOAD URL $downloadUrl");
          // print("FILE DOWNLOAD URL ${downloadUrl.split("uploads")[1].split('?')[0].split("%2F")[1]}");
          // _fileNames.add(downloadUrl.split("uploads")[1].split('?')[0].split("%2F")[1]);
        });
      }
      ;

      print("FILES LENGTH ${_fileNames.length}");
    });
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
                onTap: () {
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
            'All Files',
            style: TextStyle(
              color: Color(0xff072e79),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _isDownloading
                ? Container(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _fileNames.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          print("fileName ${_fileNames[i]}");
                          downloadFileExample(_fileNames[i]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              new GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) => HomePage()),
                                                  // );
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 5),
                                                      child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          child: Image.asset(
                                                              'assets/images/pdf_icon.png')),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5, left: 5),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1),
                                                            child: Text(
                                                              (_fileNames[i])
                                                                          .length >
                                                                      20
                                                                  ? (_fileNames[
                                                                          i])
                                                                      .replaceRange(
                                                                          25,
                                                                          _fileNames[i]
                                                                              .length,
                                                                          "...")
                                                                  : _fileNames[
                                                                      i],
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff575858),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1),
                                                            child: Text(
                                                              'Size: 154kb',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffc8cbcd),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Icon(
                                                      Icons.file_open_outlined,
                                                      color: Color(0xFFB6B6B6),
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(right:10),
                                                  //   child:  Icon(
                                                  //     Icons.clear_outlined,
                                                  //     color: Color(0xFFB6B6B6),
                                                  //     size: 18.0,
                                                  //   ),
                                                  // ),
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
                      );
                    }));
  }
}
