import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/student/details.dart';
import 'package:ugrussa/student/join.dart';
import 'package:ugrussa/chat/chat.dart';

class ChatList extends StatefulWidget {
  ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
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
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xffffffff),
                  size: 24.0,
                ),
              ));
            },
          ),
          title: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chat',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
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
                Icons.more_vert_outlined,
                color: Color(0xffffffff),
                size: 24.0,
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
            margin: EdgeInsets.only(left: 10),
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
                                  builder: (context) => DetailsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                ),
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
                                        'Kaha Mane',
                                        style: TextStyle(
                                            color: Color(0xff575858),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'I have received it thanks',
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '2:30am',
                            style: TextStyle(
                                color: Color(0xffc8cbcd),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe3e6e8),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
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
                                  builder: (context) => DetailsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                ),
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
                                        'Kaha Mane',
                                        style: TextStyle(
                                            color: Color(0xff575858),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'I have received it thanks',
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '2:30am',
                            style: TextStyle(
                                color: Color(0xffc8cbcd),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe3e6e8),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
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
                                  builder: (context) => DetailsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                ),
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
                                        'Kaha Mane',
                                        style: TextStyle(
                                            color: Color(0xff575858),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'I have received it thanks',
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '2:30am',
                            style: TextStyle(
                                color: Color(0xffc8cbcd),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe3e6e8),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
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
                                  builder: (context) => DetailsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                ),
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
                                        'Kaha Mane',
                                        style: TextStyle(
                                            color: Color(0xff575858),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'I have received it thanks',
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '2:30am',
                            style: TextStyle(
                                color: Color(0xffc8cbcd),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe3e6e8),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
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
                                  builder: (context) => DetailsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 5, bottom: 5, left: 5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(
                                          'assets/images/logo.png')),
                                ),
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
                                        'Kaha Mane',
                                        style: TextStyle(
                                            color: Color(0xff575858),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'I have received it thanks',
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
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '2:30am',
                            style: TextStyle(
                                color: Color(0xffc8cbcd),
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe3e6e8),
                )
              ],
            ),
          ),
        ])));
  }
}
