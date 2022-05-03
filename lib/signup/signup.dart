import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/login/login.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/custom_alert_dialog.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  static const routeName = "/signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;
  bool _showPassword = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _levelController = TextEditingController();
  final _residenceController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  var profilePhotoUrl = "";

  Future<void> _showChoiceDialog(BuildContext context, StateSetter setState) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Upload Image",
              style: TextStyle(color: Color(0xff3e3e3e)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  // const Divider(
                  //   height: 0,
                  //   color: Color(0xff3e3e3e),
                  // ),
                  ListTile(
                    onTap: () {
                      _openGallery(context, setState);
                    },
                    title: const Text(
                      "Device",
                    ),
                    leading: const Icon(
                      Icons.file_upload_outlined,
                      color: Color(0xfffdcb03),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context, setState);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xfffdcb03),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openCamera(BuildContext context, StateSetter setState) async {
    final XFile? pickedFile = (await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500));

    setState(() {
      if (pickedFile != null) {
        _imageFile = pickedFile;
      }
    });

    // final File? file = File(pickedFile!.path);
    // _imageFileData = file;

    Navigator.pop(context);
  }

  void _openGallery(BuildContext context, StateSetter setState) async {
    final XFile? pickedFile = (await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500));

    setState(() {
      if (pickedFile != null) {
        _imageFile = pickedFile;
      }
    });

    // final File? file = File(pickedFile!.path);
    // _imageFileData = file;
    // print(pickedFile);

    Navigator.pop(context);
  }

  Future<void> _uploadImage() async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Authenticating user",
      ),
    );

    if (_imageFile == null) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertTitle: "Profile Picture Upload",
              alertMessage:
                  "Select a profile picture to continue with the sign up process",
            );
          });
    }

    String fileName = path.basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    var uploadTask = firebaseStorageRef.putFile(File(_imageFile!.path));
    var taskSnapshot = await uploadTask.then((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then(
        (photoUrl) {
          print("Done: $photoUrl");
          profilePhotoUrl = photoUrl;
          _signup(photoUrl: profilePhotoUrl);
          // Navigator.pop(context);
        },
      );
      //Navigator.pop(context);
    });
  }

  validateForm(BuildContext context) {
    if (_nameController.text.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Name must be at least 3 characters long',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (!_emailController.text.contains("@")) {
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
    } else if (_phoneController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Phone number must be at least 10 characters long',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_passwordController.text.length < 6) {
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
    }
    //  else if (_passwordController.text != _confirmPasswordController.text) {
    // ScaffoldMessenger.of(context).showSnackBar(
    // const SnackBar(
    // content: Text(
    // 'Passwords do not match',
    // textAlign: TextAlign.center,
    // ),
    // duration: Duration(seconds: 3),
    // ),
    // );
    // return;
    // }
    else if (_levelController.text.length < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select your level',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_residenceController.text.length < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select your residence',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_studentIdController.text.length < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your student ID',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please agree to the terms and conditions',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else {
      _uploadImage();
    }
  }

  void _signup({String? photoUrl}) async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Authenticating user",
      ),
    );

    final User? firebaseUser = (await firebaseAuth
            .createUserWithEmailAndPassword(
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
      Map<String, dynamic> userMap = {
        "id": firebaseUser.uid,
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "student ID": _studentIdController.text,
        "level": _levelController.text,
        "residence": _residenceController.text,
        "profilePhotoUrl": photoUrl
      };

      // DatabaseReference driversRef =
      // FirebaseDatabase.instance.ref().child("users");

      // driversRef.child(firebaseUser.uid).set(userMap);
      // currentFirebaseUser = firebaseUser;

      FirebaseFirestore.instance
          .collection("users")
          .doc(currentFirebaseUser!.uid)
          .set(userMap);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User created successfully",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(HomePage.routeName);
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong ",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xffff4A4A);
      }
      return Color(0xffff4A4A);
    }

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
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, left: 5, bottom: 20),
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
                child: GestureDetector(
                  onTap: () => _showChoiceDialog(context, setState),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: _imageFile != null
                        ? Image.file(
                            File(_imageFile!.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/images/use_profile.png",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _nameController,
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
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
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
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _phoneController,
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
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _studentIdController,
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
                        labelText: 'Student ID',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Student ID',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _levelController,
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
                        labelText: 'Level',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Level',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _residenceController,
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
                        labelText: 'Residence',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: 'Residence',
                        hintStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _passwordController,
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
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: this._showPassword
                              ? Color(0xffff4A4A)
                              : Color(0xffC6C6C6),
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(
                              () => this._showPassword = !this._showPassword);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Checkbox(
                        activeColor: Color(0xff072e79),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      new Text(
                        "I have read the user",
                        style: new TextStyle(
                            color: Color(0xffB3B3B3),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      new Text(
                        " agreement ",
                        style: new TextStyle(
                            color: Color(0xff072e79),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      new Text(
                        "and i accept it",
                        style: new TextStyle(
                            color: Color(0xffB3B3B3),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 5, right: 5),
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
                    validateForm(context);
                  },
                  child: Text('Sign up',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account, ",
                      style: TextStyle(
                          color: Color(0xffB3B3B3),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          " Log in",
                          style: TextStyle(
                              color: Color(0xff072e79),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
