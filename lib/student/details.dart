import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ugrussa/splash/splash.dart';

import '../chat/chat.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  static const routeName = "/details";

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xff072e79),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) async {
                if (result == 0) {
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(
                Icons.search,
                color: Color(0xffffffff),
                size: 30.0,
              ),
              offset: Offset(0, kToolbarHeight),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 25),
                    child: Text(
                      'search',
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
            color: Color(0xff072e79),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Container(
                          height: 90,
                          width: 90,
                          child: Image.asset('assets/images/use_profile.png')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 40, left: 40),
                          child: Text(
                            'BSc Public Relation & mangt',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'First Year',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffc8cbcd),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 55,
                              height: 55,
                              child: Icon(Icons.call,
                                  size: 20, color: Color(0xffffffff)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x31808080)),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Chat()),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.all(10),
                              child: Container(
                                width: 55,
                                height: 55,
                                child: Icon(Icons.mark_chat_unread_sharp,
                                    size: 20, color: Color(0xffffffff)),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0x31808080)),
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 55,
                              height: 55,
                              child: Icon(Icons.email_outlined,
                                  size: 20, color: Color(0xffffffff)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x31808080)),
                            )),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: 55,
                              height: 55,
                              child: Icon(Icons.cloud_download_outlined,
                                  size: 20, color: Color(0xffffffff)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x31808080)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 4, left: 20),
                  child: Text(
                    'Biography',
                    style: TextStyle(
                      color: Color(0xff4b4b4b),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 10, left: 20),
                  child: Text(
                    'I am Kaha Mane a Public Relations & Mangt student currently in my third year at the University',
                    style: TextStyle(
                      color: Color(0xff8c8c8c),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ])));
  }
}
