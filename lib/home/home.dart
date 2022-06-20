import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ugrussa/document_upload/all_files.dart';
import 'package:ugrussa/document_upload/upload.dart';
import 'package:ugrussa/dues/summary.dart';
import 'package:ugrussa/game/game_player.dart';
import 'package:ugrussa/login/login.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/utils/utils.dart';
import 'package:ugrussa/widgets/progress_dialog.dart';
import '../chat/chat.dart';
import '../chat/chat_list.dart';
import '../student/list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8fa),
      appBar: AppBar(
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Upload()),
              );
            },
            child: Icon(
              Icons.drive_folder_upload_outlined,
              color: Color(0xff072e79),
              size: 25.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatList()),
              );
            },
            child: Icon(
              Icons.chat,
              color: Color(0xff072e79),
              size: 25.0,
            ),
          ),
          PopupMenuButton(
            onSelected: (result) async {
              if (result == 0) {
                // Navigator.of(context).pop();
                //sign out
                firebaseAuth.signOut();
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
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
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
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
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListPage()),
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Flexible(
                                      child: Text(
                                        'Student Registration',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Image.asset(
                                    'assets/images/student_reg.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
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
                      )),
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListPage()),
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Flexible(
                                      child: Text(
                                        'Course Combination',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Image.asset(
                                    'assets/images/course_reg.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
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
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SummaryPage()),
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Flexible(
                                      child: Text(
                                        'Dues Payment Option',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child:
                                    Image.asset('assets/images/payments.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
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
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllFiles()),
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Flexible(
                                      child: Text(
                                        'Academic Calendar',
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child:
                                    Image.asset('assets/images/calendar.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 20, right: 5, left: 10, bottom: 10),
                alignment: Alignment.topRight,
                child: Text(
                  'Our Alumni',
                  style: TextStyle(
                    color: Color(0xff575858),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, right: 5, left: 10, bottom: 10),
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'more',
                        style: TextStyle(
                          color: Color(0xffc8cbcd),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      margin: EdgeInsets.only(right: 5, left: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc8cbcd),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.chevron_right_rounded,
                        size: 15,
                        color: Color(0xffe0e2e3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(right: 2),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(30.0),
                    color: Color(0xffffffff),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                    'assets/images/use_profile.png')),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Kemi Dzaks',
                              style: TextStyle(
                                  color: Color(0xff575858),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Student Rep.',
                              style: TextStyle(
                                  color: Color(0xffc8cbcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0, top: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff072e79),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Color(0xff072e79)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Color(0xffffffff),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                    'assets/images/use_profile.png')),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Kemi Dzaks',
                              style: TextStyle(
                                  color: Color(0xff575858),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Student Rep.',
                              style: TextStyle(
                                  color: Color(0xffc8cbcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0, top: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff072e79),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Color(0xff072e79)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Color(0xffffffff),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                    'assets/images/use_profile.png')),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Kemi Dzaks',
                              style: TextStyle(
                                  color: Color(0xff575858),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Student Rep.',
                              style: TextStyle(
                                  color: Color(0xffc8cbcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0, top: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff072e79),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Color(0xff072e79)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Color(0xffffffff),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                    'assets/images/use_profile.png')),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Kemi Dzaks',
                              style: TextStyle(
                                  color: Color(0xff575858),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0, top: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              'Student Rep.',
                              style: TextStyle(
                                  color: Color(0xffc8cbcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0, top: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff072e79),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0),
                                  side: BorderSide(color: Color(0xff072e79)),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(30.0),
                      color: Color(0xffffffff),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Splash()),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          'assets/images/use_profile.png')),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 5, top: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          'Kaha Mane',
                                          style: TextStyle(
                                              color: Color(0xff575858),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 5, top: 1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          '5 minutes ago',
                                          style: TextStyle(
                                              color: Color(0xffc8cbcd),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(left: 0, right: 0),
                          child: Icon(
                            Icons.more_vert_rounded,
                            size: 30,
                            color: Color(0xffe0e2e3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          'UGRUSSA particated in  2022 inter hall soccer competition.',
                          style: TextStyle(
                              color: Color(0xff575858),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 250,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/interhall_overlay.png"),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(1), BlendMode.dstATop),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            child: new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Splash()),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(
                                  top: 0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff072e79),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Color(0xffffffff),
                                  size: 40.0,
                                  semanticLabel: 'Play',
                                ),
                              ),
                            ))),
                  ),
                ])))
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamePlayer()),
          );
        },
        backgroundColor: Color(0xfffbbc07),
        child: const Icon(Icons.games_outlined),
      ),
    );
  }
}
