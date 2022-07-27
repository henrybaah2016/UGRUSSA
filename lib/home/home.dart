import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ugrussa/document_upload/all_files.dart';
import 'package:ugrussa/document_upload/news_upload.dart';
import 'package:ugrussa/document_upload/upload.dart';
import 'package:ugrussa/dues/card_payment.dart';
import 'package:ugrussa/dues/summary.dart';
import 'package:ugrussa/game/game_board.dart';
import 'package:ugrussa/game/game_player.dart';
import 'package:ugrussa/home/feed_detail.dart';
import 'package:ugrussa/login/login.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/utils/image_loader.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';
import '../chat/chat.dart';
import '../chat/chat_list.dart';
import '../student/list.dart';
import '../widgets/notification_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool admin = false;
  var _feeds = [];
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    // fetchAllFeeds();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      admin = prefs.getBool(ADMIN)!;
    });

    fetchAllFeeds();
  }

  bottomSheetCardPayment(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CardPayment();
      },
    );
  }

  void fetchAllFeeds() async {
    setState(() {
      _isLoading = true;
    });
    // var ref = await FirebaseDatabase.instance.ref().child("users").once();
    //
    // print("REF ${ref.snapshot.children.toList()}");
    //
    // ref.snapshot.children.toList().forEach((element) {
    //   print("USER DATA SNAPSHOT ${element.value}");
    //
    //   users.add(element.value);
    // });
    //
    // print("USERS LIST $users");
    //

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('feeds');
    // Get docs from collection reference
    _collectionRef.get().then((querySnapshot) {
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        _feeds = allData;
        _isLoading = false;
      });
      print("ALL FEEDS DATA $_feeds");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8fa),
      appBar: AppBar(
        // toolbarHeight: 80,
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              height: 45,
              width: 45,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/images/logo.png'),
              ),
            );
          },
        ),
        title: const Text(
          'UGRUSSA',
          style: TextStyle(
            color: Color(0xff072e79),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          admin
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Upload()),
                    );
                  },
                  child: Image.asset(
                    "assets/images/file.png",
                    width: 30,
                    fit: BoxFit.contain,
                  ),
                )
              : Container(),
          PopupMenuButton(
            onSelected: (result) async {
              if (result == 0) {
                // Navigator.of(context).pop();
                //sign out
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) {
                      return NotificationDialog(
                        infoTitle: "Logout of Account",
                        infoText:
                        "Are you sure you want to logout of your account?",
                        firstButtonText: "No",
                        firstButtonAction: () {
                          Navigator.pop(context);
                        },
                        secondButtonText: "Yes",
                        secondButtonAction: () {
                          firebaseAuth.signOut();
                          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                        },
                      );
                    });

              }
            },
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Color(0xff072e79),
              size: 30.0,
            ),
            offset: Offset(0, kToolbarHeight),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 25),
                  child: Text(
                    'Logout',
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
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0, top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListPage()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xfffbbc07),
                                Color(0xff4c84ea),
                              ],
                            )),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Student.',
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Registration.',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10),
                                child: Image.asset(
                                  'assets/images/student_reg.png',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListPage()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xfffbbc07),
                              Color(0xffef6588),
                            ],
                          ),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Course',
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Combination',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10),
                                child:
                                    Image.asset('assets/images/course_reg.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bottomSheetCardPayment(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffef6588),
                                Color(0xff4c84ea),
                              ],
                            )),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Dues',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Payment',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  )),
                              Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  child:
                                      Image.asset('assets/images/payments.png'))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllFiles()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff072e79),
                                Color(0xffa0e8a8),
                              ],
                            )),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Academic',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Calendar',
                                            style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  )),
                              Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  child:
                                      Image.asset('assets/images/calendar.png'))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(
            //             top: 20, right: 5, left: 10, bottom: 10),
            //         alignment: Alignment.topRight,
            //         child: Text(
            //           'Our Alumni',
            //           style: TextStyle(
            //             color: Color(0xff575858),
            //             fontSize: 18,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(
            //             top: 20, right: 5, left: 10, bottom: 10),
            //         alignment: Alignment.topRight,
            //         child: Row(
            //           children: [
            //             Container(
            //               child: Text(
            //                 'more',
            //                 style: TextStyle(
            //                   color: Color(0xffc8cbcd),
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               height: 14,
            //               width: 14,
            //               margin: EdgeInsets.only(right: 5, left: 5),
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 color: Color(0xffc8cbcd),
            //               ),
            //               alignment: Alignment.center,
            //               child: Icon(
            //                 Icons.chevron_right_rounded,
            //                 size: 15,
            //                 color: Color(0xffe0e2e3),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 200,
            //   margin: EdgeInsets.only(right: 2),
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //       Card(
            //         clipBehavior: Clip.antiAlias,
            //         child: Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             borderRadius: new BorderRadius.circular(30.0),
            //             color: Color(0xffffffff),
            //           ),
            //           margin: EdgeInsets.only(left: 10, top: 5),
            //           child: Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 20),
            //                 child: new GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => Splash()),
            //                     );
            //                   },
            //                   child: ClipRRect(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(100)),
            //                     child: Container(
            //                         height: 50,
            //                         width: 50,
            //                         child: Image.asset(
            //                             'assets/images/use_profile.png')),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 5),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Kemi Dzaks',
            //                       style: TextStyle(
            //                           color: Color(0xff575858),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 1),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Student Rep.',
            //                       style: TextStyle(
            //                           color: Color(0xffc8cbcd),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                 alignment: Alignment.center,
            //                 margin: EdgeInsets.only(left: 0, top: 1),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Container(
            //                     margin:
            //                         EdgeInsets.only(top: 0, left: 5, right: 5),
            //                     child: ElevatedButton(
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Color(0xff072e79),
            //                         shape: new RoundedRectangleBorder(
            //                           borderRadius:
            //                               new BorderRadius.circular(50.0),
            //                           side:
            //                               BorderSide(color: Color(0xff072e79)),
            //                         ),
            //                       ),
            //                       onPressed: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => HomePage()),
            //                         );
            //                       },
            //                       child: Text(
            //                         'Follow',
            //                         style: TextStyle(
            //                           color: Color(0xffffffff),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Card(
            //         clipBehavior: Clip.antiAlias,
            //         child: Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             borderRadius: new BorderRadius.circular(10.0),
            //             color: Color(0xffffffff),
            //           ),
            //           margin: EdgeInsets.only(left: 10, top: 5),
            //           child: Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 20),
            //                 child: new GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => Splash()),
            //                     );
            //                   },
            //                   child: ClipRRect(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(100)),
            //                     child: Container(
            //                         height: 50,
            //                         width: 50,
            //                         child: Image.asset(
            //                             'assets/images/use_profile.png')),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 5),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Kemi Dzaks',
            //                       style: TextStyle(
            //                           color: Color(0xff575858),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 1),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Student Rep.',
            //                       style: TextStyle(
            //                           color: Color(0xffc8cbcd),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                 alignment: Alignment.center,
            //                 margin: EdgeInsets.only(left: 0, top: 1),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Container(
            //                     margin:
            //                         EdgeInsets.only(top: 0, left: 5, right: 5),
            //                     child: ElevatedButton(
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Color(0xff072e79),
            //                         shape: new RoundedRectangleBorder(
            //                           borderRadius:
            //                               new BorderRadius.circular(50.0),
            //                           side:
            //                               BorderSide(color: Color(0xff072e79)),
            //                         ),
            //                       ),
            //                       onPressed: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => HomePage()),
            //                         );
            //                       },
            //                       child: Text(
            //                         'Follow',
            //                         style: TextStyle(
            //                           color: Color(0xffffffff),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Card(
            //         clipBehavior: Clip.antiAlias,
            //         child: Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             borderRadius: new BorderRadius.circular(10.0),
            //             color: Color(0xffffffff),
            //           ),
            //           margin: EdgeInsets.only(left: 10, top: 5),
            //           child: Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 20),
            //                 child: new GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => Splash()),
            //                     );
            //                   },
            //                   child: ClipRRect(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(100)),
            //                     child: Container(
            //                         height: 50,
            //                         width: 50,
            //                         child: Image.asset(
            //                             'assets/images/use_profile.png')),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 5),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Kemi Dzaks',
            //                       style: TextStyle(
            //                           color: Color(0xff575858),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 1),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Student Rep.',
            //                       style: TextStyle(
            //                           color: Color(0xffc8cbcd),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                 alignment: Alignment.center,
            //                 margin: EdgeInsets.only(left: 0, top: 1),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Container(
            //                     margin:
            //                         EdgeInsets.only(top: 0, left: 5, right: 5),
            //                     child: ElevatedButton(
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Color(0xff072e79),
            //                         shape: new RoundedRectangleBorder(
            //                           borderRadius:
            //                               new BorderRadius.circular(50.0),
            //                           side:
            //                               BorderSide(color: Color(0xff072e79)),
            //                         ),
            //                       ),
            //                       onPressed: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => HomePage()),
            //                         );
            //                       },
            //                       child: Text(
            //                         'Follow',
            //                         style: TextStyle(
            //                           color: Color(0xffffffff),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Card(
            //         clipBehavior: Clip.antiAlias,
            //         child: Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             borderRadius: new BorderRadius.circular(10.0),
            //             color: Color(0xffffffff),
            //           ),
            //           margin: EdgeInsets.only(left: 10, top: 5),
            //           child: Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 20),
            //                 child: new GestureDetector(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => Splash()),
            //                     );
            //                   },
            //                   child: ClipRRect(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(100)),
            //                     child: Container(
            //                         height: 50,
            //                         width: 50,
            //                         child: Image.asset(
            //                             'assets/images/use_profile.png')),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 5),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Kemi Dzaks',
            //                       style: TextStyle(
            //                           color: Color(0xff575858),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                   alignment: Alignment.center,
            //                   margin: EdgeInsets.only(left: 0, top: 1),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(1),
            //                     child: Text(
            //                       'Student Rep.',
            //                       style: TextStyle(
            //                           color: Color(0xffc8cbcd),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                   )),
            //               Container(
            //                 alignment: Alignment.center,
            //                 margin: EdgeInsets.only(left: 0, top: 1),
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Container(
            //                     margin:
            //                         EdgeInsets.only(top: 0, left: 5, right: 5),
            //                     child: ElevatedButton(
            //                       style: ElevatedButton.styleFrom(
            //                         primary: Color(0xff072e79),
            //                         shape: new RoundedRectangleBorder(
            //                           borderRadius:
            //                               new BorderRadius.circular(50.0),
            //                           side:
            //                               BorderSide(color: Color(0xff072e79)),
            //                         ),
            //                       ),
            //                       onPressed: () {
            //                         Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => HomePage()),
            //                         );
            //                       },
            //                       child: Text(
            //                         'Follow',
            //                         style: TextStyle(
            //                           color: Color(0xffffffff),
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w700,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            _isLoading
                ? Container(
                    height: 200,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: CircularProgressIndicator(),
                  )
                : _feeds.isEmpty
                    ? Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Text("No feeds available"),
                      )
                    : Column(
                        children: [
                          ..._feeds.map((e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return FeedDetail(
                                          description: e["description"],
                                          fileUrl: e["file"],
                                          date: (e["date"] as Timestamp)
                                              .toDate());
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: 10, right: 10, left: 10),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                          color: Color(0xffffffff),
                                        ),
                                        margin: EdgeInsets.only(left: 10, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(100)),
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Image.asset(
                                                        'assets/images/use_profile.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 5, top: 5),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1),
                                                          child: Text(
                                                            'Admin@UGRUSSA',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff575858),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 5, top: 1),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(1),
                                                          child: Text(
                                                            DateFormat
                                                                    .yMMMMEEEEd()
                                                                .format(
                                                              e['date'].toDate(),
                                                            ),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xffc8cbcd),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Container(
                                            //   alignment: Alignment.topRight,
                                            //   margin: EdgeInsets.only(left: 0, right: 0),
                                            //   child: Icon(
                                            //     Icons.more_vert_rounded,
                                            //     size: 30,
                                            //     color: Color(0xffe0e2e3),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: 350,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: Text(
                                            e['description'].toString().length >
                                                    90
                                                ? e['description']
                                                    .toString()
                                                    .replaceRange(
                                                        90,
                                                        e['description']
                                                            .toString()
                                                            .length,
                                                        " ... read more")
                                                : e['description'].toString(),
                                            style: TextStyle(
                                              color: Color(0xff575858),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 250,
                                        width: double.infinity,
                                        margin: EdgeInsets.all(10),
                                        child: ImageLoader(
                                          url: e['file'],
                                          imageHeight: 250,
                                          imageWidth: double.infinity,
                                          spinnerHeight: 25,
                                          spinnerWidth: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          const SizedBox(height: 80),
                        ],
                      ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          admin
              ? FloatingActionButton(
                  child: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsUpload(),
                      ),
                      // MaterialPageRoute(builder: (context) => Upload()),
                    );
                  },
                  heroTag: null,
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePlayer(),
                ),
                // MaterialPageRoute(builder: (context) => Upload()),
              );
            },
            backgroundColor: Color(0xfffbbc07),
            child: const Icon(Icons.games_outlined),
          ),
        ],
      ),
    );
  }
}
