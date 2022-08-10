import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String _phoneNumber = "";

  var _levels = [
    "100",
    "200",
    "300",
    "400",
    "Non Student",
    "Alumnus",// non student
  ];

  var _currentSelectedLevel = "100";

  var _residence = [
    "Traditional hall",
    "Diaspora",
    "Pentagon",
    "Evandy",
    "TF",
    "Not applicable"
    // not applicable
  ];

  var _currentSelectedResidence = "Traditional hall";

  Future<void> _showChoiceDialog(BuildContext context, StateSetter setState) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Upload Profile Picture",
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
        message: "Creating account...",
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
        },
      );
    }

    String fileName = path.basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profile_photos/$fileName');
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

  _validateForm(BuildContext context) {
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
    } else if (_phoneNumber.isEmpty) {
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
    else if (_currentSelectedLevel.isEmpty) {
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
    } else if (_currentSelectedResidence.isEmpty) {
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
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool(ADMIN, false);
      Map<String, dynamic> userMap = {
        "id": firebaseUser.uid,
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneNumber,
        "student ID": _studentIdController.text,
        "level": _currentSelectedLevel,
        "residence": _currentSelectedResidence,
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

      //save data locally
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setString("userUID", currentFirebaseUser!.uid);
      await sharedPreferences!.setString("email", _emailController.text.trim());
      await sharedPreferences!.setString("name", _nameController.text.trim());
      await sharedPreferences!.setString("phone", _phoneController.text.trim());
      await sharedPreferences!
          .setString("studentID", _studentIdController.text.trim());
      await sharedPreferences!.setString("level", _levelController.text.trim());
      await sharedPreferences!
          .setString("residence", _residenceController.text.trim());
      await sharedPreferences!.setString("profilePhotoUrl", photoUrl!);

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
                            "assets/images/profile_avatar.png",
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
                        hintText: '',
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
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 25),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 5, right: 5),
              //     child: TextField(
              //       controller: _phoneController,
              //       keyboardType: TextInputType.number,
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xff000000)),
              //           ),
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           labelText: 'Phone Number',
              //           labelStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 12,
              //               fontWeight: FontWeight.w600),
              //           contentPadding: EdgeInsets.only(bottom: 0, left: 10),
              //           hintText: 'Phone Number',
              //           hintStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600)),
              //     ),
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffB3B3B3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    setState(() {
                      _phoneNumber = number.phoneNumber!;
                    });
                  },
                  onInputValidated: (bool value) {
                    print("Value here $value");
                    if (value) {
                      print("Number is correct");
                      // setState(() {
                      //   _showBanner = true;
                      //   _errorMessage = "Phone number is valid";
                      // });
                    } else {
                      // setState(() {
                      //   _showBanner = true;
                      //   _errorMessage =
                      //   "Please enter a valid phone number";
                      // });
                    }
                  },
                  // selectorConfig: const SelectorConfig(
                  //   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  // ),

                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: _phoneController,
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: InputBorder.none,
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
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
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 25),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 5, right: 5),
              //     child: TextField(
              //       controller: _levelController,
              //       keyboardType: TextInputType.text,
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xff000000)),
              //           ),
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           labelText: 'Level',
              //           labelStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 12,
              //               fontWeight: FontWeight.w600),
              //           contentPadding: EdgeInsets.only(bottom: 0, left: 10),
              //           hintText: 'Level',
              //           hintStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600)),
              //     ),
              //   ),
              // ),

              Container(
                margin: const EdgeInsets.only(
                  bottom: 25,
                  left: 5,
                  right: 5,
                ),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
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
                        labelText: 'Select level',
                        labelStyle: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: '',
                        hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      isEmpty: _currentSelectedLevel == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedLevel,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentSelectedLevel = newValue!;
                              state.didChange(newValue);
                            });
                          },
                          items: _levels.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 25),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 5, right: 5),
              //     child: TextField(
              //       controller: _residenceController,
              //       keyboardType: TextInputType.text,
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xff000000)),
              //           ),
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(color: Color(0xffB3B3B3)),
              //           ),
              //           labelText: 'Residence',
              //           labelStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 12,
              //               fontWeight: FontWeight.w600),
              //           contentPadding: EdgeInsets.only(bottom: 0, left: 10),
              //           hintText: 'Residence',
              //           hintStyle: TextStyle(
              //               color: Color(0xff000000),
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600)),
              //     ),
              //   ),
              // ),

              Container(
                margin: const EdgeInsets.only(
                  bottom: 25,
                  left: 5,
                  right: 5,
                ),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
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
                        labelText: 'Select residence',
                        labelStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                        hintText: '',
                        hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      isEmpty: _currentSelectedResidence == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedResidence,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentSelectedResidence = newValue!;
                              state.didChange(newValue);
                            });
                          },
                          items: _residence.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextField(
                    controller: _passwordController,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: this._showPassword
                              ? Color(0xffff4A4A)
                              : Color(0xffC6C6C6),
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(
                            () => this._showPassword = !this._showPassword,
                          );
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
                        "and I accept it",
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
                    _validateForm(context);
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
