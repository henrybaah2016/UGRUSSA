import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_wizard/multi_wizard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';

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

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _residenceController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  final _studentIdController = TextEditingController();
  final _levelController = TextEditingController();
  final _yearController = TextEditingController();
  final _academicProgrammeController = TextEditingController();

  String? _dateOfBirth;

  var _levels = [
    "100",
    "200",
    "300",
    "400",
    "Non Student", // non student
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

  var _gender = [
    "Male",
    "Female",
  ];

  var _currentSelectedGender = "Male";

  // TODO : USE DATE PICKER FOR DATE OF BIRTH

  validateForm(BuildContext context) {
    if (_fullNameController.text.length < 3) {
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
    } else if (_dateOfBirth!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Date of Birth cannot be empty',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_currentSelectedGender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Gender is required',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_yearController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Year is required',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_currentSelectedLevel.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Level is required',
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
            'Residence is required',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_academicProgrammeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Academic programme is required',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else if (_studentIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Student ID is required',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    } else {
      _registerStudent();
    }
  }

  Future<void> _registerStudent() async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (ctx) => ProgressDialog(
        message: "Registering student ...",
      ),
    );
    Map<String, dynamic> studentMap = {
      "id": currentFirebaseUser!.uid,
      "Full name": _fullNameController.text,
      "Email": _emailController.text,
      "Gender": _currentSelectedGender,
      "Student ID": _studentIdController.text,
      "Level": _currentSelectedLevel,
      "Residence": _currentSelectedResidence,
      "Date of  birth": _dateOfBirthController.text,
      "Year": _yearController.text,
      "Academic Programme": _academicProgrammeController.text,
    };

    FirebaseFirestore.instance
        .collection("students")
        .doc(currentFirebaseUser!.uid)
        .set(studentMap)
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Student Registered successfully",
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(HomePage.routeName);
    }).catchError((error) {
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
    });

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("gender", _genderController.text.trim());
    await sharedPreferences!
        .setString("dateOfBirth", _dateOfBirthController.text.trim());
    await sharedPreferences!.setString("year", _yearController.text.trim());
    await sharedPreferences!.setString(
        "academicProgramme", _academicProgrammeController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    String name = "";

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff072e79),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xffffffff),
                  size: 24.0,
                ),
              ),
            );
          },
        ),
        title: const Text(
          'Kaha Mane',
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
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
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, right: 4, left: 0, bottom: 20),
                                child: Text(
                                  'General Information',
                                  style: TextStyle(
                                    color: Color(0xff4b4b4b),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: TextField(
                                    controller: _fullNameController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Full Name',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
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
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Student Email',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
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
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Select residence',
                                        labelStyle: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: 'Select residence',
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
                                              _currentSelectedResidence =
                                                  newValue!;
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
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Select gender',
                                        labelStyle: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: 'Select Gender',
                                        hintStyle: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      isEmpty: _currentSelectedGender == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: _currentSelectedGender,
                                          isDense: true,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _currentSelectedGender =
                                                  newValue!;
                                              state.didChange(newValue);
                                            });
                                          },
                                          items: _gender.map((String value) {
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
                              //       controller: _dateOfBirthController,
                              //       keyboardType: TextInputType.text,
                              //       decoration: InputDecoration(
                              //           enabledBorder: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xffB3B3B3)),
                              //           ),
                              //           focusedBorder: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xff000000)),
                              //           ),
                              //           border: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xffB3B3B3)),
                              //           ),
                              //           labelText: 'Date of Birth',
                              //           labelStyle: TextStyle(
                              //               color: Color(0xff000000),
                              //               fontSize: 12,
                              //               fontWeight: FontWeight.w600),
                              //           contentPadding: EdgeInsets.only(
                              //               bottom: 0, left: 10),
                              //           hintText: 'Date of Birth',
                              //           hintStyle: TextStyle(
                              //               color: Color(0xff000000),
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w600)),
                              //     ),
                              //   ),
                              // ),

                              GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      // minTime: DateTime(2018, 3, 5),
                                      // maxTime: DateTime(2019, 6, 7),
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    setState((){
                                      _dateOfBirth = DateFormat
                                          .yMMMd()
                                          .format(
                                          date,
                                      );
                                    });
                                    print("DATE OF BIRTH CHOSEN $_dateOfBirth");
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                  margin: const EdgeInsets.only(bottom: 25,left:5,right: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(3)
                                  ),
                                  child: Text(
                                    _dateOfBirth ?? 'Date of Birth',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  WizardStep(
                    child: Center(
                      child: Form(
                        key: _key,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, right: 4, left: 0, bottom: 20),
                                child: Text(
                                  'Student Information',
                                  style: TextStyle(
                                    color: Color(0xff4b4b4b),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
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
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Student ID',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
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
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Select level',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: 'Select level',
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
                              Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: TextField(
                                    controller: _yearController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Year',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: TextField(
                                    controller: _academicProgrammeController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff000000)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB3B3B3)),
                                        ),
                                        labelText: 'Academic Programme',
                                        labelStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        contentPadding: EdgeInsets.only(
                                            bottom: 0, left: 10),
                                        hintText: '',
                                        hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
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
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    // content: Text('You have joined the UGRUSSA!'),
                    // duration: Duration(seconds: 5),
                    // ));
                    validateForm(context);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
