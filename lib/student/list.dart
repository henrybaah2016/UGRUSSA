import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/student/details.dart';
import 'package:ugrussa/student/join.dart';



class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}


class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color (0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                height:45,
                width:45,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: Image.asset('assets/images/logo.png'),

                ),
              );
            },
          ),
          title: const Text('UGRUSSA',style: TextStyle(color: Color(0xff072e79), fontSize: 20, fontWeight: FontWeight.w600,),),

          actions: <Widget>[
                  PopupMenuButton(
                    onSelected: (result) async {
                      if(result == 0){
                        Navigator.of(context).pop();
                      }

                    },

                    icon:const Icon(

                      Icons.search,
                      color: Color(0xff072e79),
                      size: 30.0,


                    ),
                    offset: Offset(0, kToolbarHeight),

                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child:Padding(
                          padding: EdgeInsets.only(left:8.0,right: 25),
                          child: Text('search',style: TextStyle(color: Color(0xff3e3956), fontSize: 20,fontWeight: FontWeight.w400),),
                        ),
                        value: 0,
                      ),

                    ],
                  ),
                ],
              ),

        body:SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 5,left: 10,bottom: 10),
                    alignment: Alignment.topRight,
                    child: Text(
                      'All Students',
                      style: TextStyle(color: Color(0xff575858), fontSize: 18, fontWeight: FontWeight.w600, ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinPage()),
                      );
                    },
                      child:Container(
                        margin: EdgeInsets.only(top: 20, right: 5,left: 10,bottom: 10),
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:4),
                              child: Text(
                                'Join',
                                style: TextStyle(color: Color(0xff072e79), fontSize: 18, fontWeight: FontWeight.w600, ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Icon(
                                Icons.person_add_alt,
                                size: 20,
                                color: Color(0xff072e79),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),

                ],
              ),
            ),


            Container(
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                          child:Row(

                            children: [
                              Container(
                                margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                child:ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      height:45,
                                      width:45,
                                      child: Image.asset('assets/images/use_profile.png')
                                  ),
                                ),

                              ),

                              Container(
                                margin:EdgeInsets.only(top: 5,left:5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                                Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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
              margin:EdgeInsets.only(left:10),

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
                                MaterialPageRoute(builder: (context) => DetailsPage()),
                              );
                            },
                            child:Row(

                              children: [
                                Container(
                                  margin:EdgeInsets.only(top:5,bottom:5,left: 5),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Container(
                                        height:45,
                                        width:45,
                                        child: Image.asset('assets/images/use_profile.png')
                                    ),
                                  ),

                                ),

                                Container(
                                  margin:EdgeInsets.only(top: 5,left:5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('Kaha Mane',style: TextStyle(color: Color(0xff575858), fontSize: 16, fontWeight: FontWeight.w600),),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text('BSc. Computer Science',style: TextStyle(color: Color(0xffc8cbcd),fontSize: 14, fontWeight: FontWeight.normal),),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_rounded,
                              size: 24,
                              color: Color(0xffc4c5c6),
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.person_outlined),
                                  title: Text('Profile'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Edit'),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.clear),
                                  title: Text('Delete'),
                                ),
                              ),

                            ],
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




          ]
        )
      )

    );

  }
}


