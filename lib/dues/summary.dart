import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';


import '../main.dart';


class SummaryPage extends StatefulWidget {
  SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}


class _SummaryPageState extends State<SummaryPage> with SingleTickerProviderStateMixin {

  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }
  bool isReadmore= false;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff072e79),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xffffffff),
                size: 24.0,
              ),
            );
          },
        ),
        title: const Text('Dues Summary',style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.normal,),),

        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) async {
              if(result == 0){
                Navigator.of(context).pop();
              }

            },

            icon:const Icon(

              Icons.more_vert_rounded,
              color: Color(0xffffffff),
              size: 30.0,


            ),
            offset: Offset(0, kToolbarHeight),

            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child:Padding(
                  padding: EdgeInsets.only(left:8.0,right: 25),
                  child: Text('logout',style: TextStyle(color: Color(0xff3e3956), fontSize: 20,fontWeight: FontWeight.w400),),
                ),
                value: 0,
              ),

            ],
          ),
        ],
      ),

      body: new SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  alignment:Alignment.topLeft,
                  height: 200,
                  width: double.infinity,
                  color: Color(0xff072e79),

                    child: Row(
                      children: [
                        Container(
                          width:40,
                          height:40,
                          margin:EdgeInsets.only(left:10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/balance_icon.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('GH1245.00',style: TextStyle(color: Color(0xffffffff), fontSize: 22, fontWeight: FontWeight.normal),),
                        ),
                      ],
                    )


                ),

                Container(
                    width: double.infinity,
                    color: Color(0xffffffff),
                    child:Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(top:120,bottom: 2,left:10,right:10),
                          child:Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom:10),
                                alignment: Alignment.topLeft,
                                child: Text('STORYLINE',style: TextStyle(color: Color(0xff000000), fontSize: 18, fontWeight: FontWeight.w700),),


                              ),
                              buildText("In 1967 The people of the North had,In 1967 "
                                  "The people of the North had,In 1967 "
                                  "The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had"
                                  "In 1967 The people of the North had ",style: TextStyle(fontSize: 16,color:Color(0xffffffff)),),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffffffff),
                                  elevation: 0,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(0.0),
                                    side: BorderSide(color: Color(0xffffffff)),
                                  ),
                                ),
                                onPressed: (){

                                  setState(() {
                                    // toggle the bool variable true or false
                                    isReadmore = !isReadmore;
                                  });
                                }, child: Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color:Color(0xff339af0),
                                    size:30,
                                  )

                              ),
                              )
                            ],
                          ),


                        ),




                        Container(
                          margin: EdgeInsets.only(top:5,bottom: 20),
                          child: new TabBar(
                            controller: _controller,
                            indicatorWeight: 3,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                            indicatorColor: Color(0xffff4A4A),
                            labelColor:Color(0xffff4A4A),
                            unselectedLabelColor: Color(0xff000000),
                            labelStyle: TextStyle( fontSize: 18, fontWeight: FontWeight.w700,),
                            unselectedLabelStyle: TextStyle(color: Color(0xff000000), fontSize: 18, fontWeight: FontWeight.w700,),

                            tabs: [
                              new Tab(

                                text: 'CAST',
                              ),
                              new Tab(
                                text: 'PHOTOS',
                              ),
                              new Tab(
                                text: 'REVIEWS',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 200.0,
                          child: new TabBarView(
                            controller: _controller,

                            children: <Widget>[
                              Container(
                                height: 270,
                                margin:EdgeInsets.only(right:2),

                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      width: 120,
                                      margin:EdgeInsets.only(left:10,top:5),

                                      child: Column(
                                        children: [
                                          new GestureDetector(
                                            onTap: () {

                                            },
                                            child:ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              child: Container(
                                                  child: Image.asset('assets/images/comedy.png')
                                              ),
                                            ),),

                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin:EdgeInsets.only(left:0,top:5),
                                              child: Padding(
                                                padding: const EdgeInsets.all(1),
                                                child: Text('Planners',style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.normal),),

                                              )

                                          ),
                                        ],
                                      ),


                                    ),
                                    Container(
                                      width: 120,
                                      margin:EdgeInsets.only(left:10,top:5),

                                      child: Column(
                                        children: [
                                          new GestureDetector(
                                            onTap: () {
                                            },
                                            child:ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              child: Container(
                                                  child: Image.asset('assets/images/inspring.png')
                                              ),
                                            ),),

                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin:EdgeInsets.only(left:0,top:5),
                                              child: Padding(
                                                padding: const EdgeInsets.all(1),
                                                child: Text('The Waves',style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.normal),),

                                              )

                                          ),
                                        ],
                                      ),


                                    ),
                                    Container(
                                      width: 120,
                                      margin:EdgeInsets.only(left:10,top:5),

                                      child: Column(
                                        children: [
                                          new GestureDetector(
                                            onTap: () {

                                            },
                                            child:ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              child: Container(
                                                  child: Image.asset('assets/images/history.png')
                                              ),
                                            ),),

                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin:EdgeInsets.only(left:0,top:5),
                                              child: Padding(
                                                padding: const EdgeInsets.all(1),
                                                child: Text('Ancestry',style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.normal),),

                                              )

                                          ),
                                        ],
                                      ),


                                    ),
                                  ],
                                ),
                              ),
                              Container(

                                child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.0,
                                    padding: const EdgeInsets.all(10.0),
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    children: <String>[
                                      'assets/images/history.png',
                                      'assets/images/twins.png',
                                      'assets/images/history.png',
                                    ].map((String url) {
                                      return GridTile(
                                          child:ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              child: Image.asset(url, fit: BoxFit.cover))

                                      );
                                    }).toList()),
                              ),

                              Container(

                                  child:ListView(

                                    scrollDirection: Axis.vertical,

                                    children: [

                                      Container(
                                        color:Color(0xffffffff),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,

                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(left: 10,top: 15),
                                                        alignment:Alignment.center,
//
                                                        child:ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                                          child: Container(
                                                              width:50,
                                                              child: Image.asset('assets/images/use_profile.png')
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),

                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 20,bottom: 5, left: 8, right: 8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [

                                                                Padding(
                                                                  padding: const EdgeInsets.only(right:5),
                                                                  child: Text('Allen',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w500,), textAlign: TextAlign.left,),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(0),
                                                                  child: Text('10:40',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top:5),
                                                          child: Text('This movie is very historic for me',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w800,),),
                                                        ),

                                                      ],
                                                    ),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color:Color(0xffffffff),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,

                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(left: 10,top: 15),
                                                        alignment:Alignment.center,
//
                                                        child:ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                                          child: Container(
                                                              width:50,
                                                              child: Image.asset('assets/images/use_profile.png')
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),

                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 20,bottom: 5, left: 8, right: 8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [

                                                                Padding(
                                                                  padding: const EdgeInsets.only(right:5),
                                                                  child: Text('Allen',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w500,), textAlign: TextAlign.left,),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(0),
                                                                  child: Text('10:40',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top:5),
                                                          child: Text('This movie is very historic for me',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w800,),),
                                                        ),

                                                      ],
                                                    ),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color:Color(0xffffffff),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,

                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(left: 10,top: 15),
                                                        alignment:Alignment.center,
//
                                                        child:ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                                          child: Container(
                                                              width:50,
                                                              child: Image.asset('assets/images/use_profile.png')
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),

                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 20,bottom: 5, left: 8, right: 8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [

                                                                Padding(
                                                                  padding: const EdgeInsets.only(right:5),
                                                                  child: Text('Allen',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w500,), textAlign: TextAlign.left,),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(0),
                                                                  child: Text('10:40',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top:5),
                                                          child: Text('This movie is very historic for me',style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w800,),),
                                                        ),

                                                      ],
                                                    ),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  )
                              )
                            ],
                          ),
                        ),


                        Container(
                            margin: EdgeInsets.only(top:10),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Container(
                                  margin: EdgeInsets.only(bottom:10,left:10),
                                  alignment: Alignment.topLeft,
                                  child: Text('\$6.8',style: TextStyle(color: Color(0xff000000), fontSize: 30, fontWeight: FontWeight.w700),),


                                ),


                                Container(
                                  margin: EdgeInsets.only(bottom:10),
                                  alignment: Alignment.topLeft,
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 60),
                                      primary: Color(0xffff4A4A),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(0.0),
                                        side: BorderSide(color: Color(0xffff4A4A)),
                                      ),
                                    ),
                                    onPressed: () {

                                    },
                                    child: Text('BUY NOW',style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w600,),),
                                  ),

                                ),



                              ],
                            )
                        )


                      ],
                    )


                ),

              ],
            ),
      Card(
        elevation:10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
          child: Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .13,
                  right: 10.0,
                  // Container(
                  //     alignment:Alignment.topLeft,
                  //     height: 150,
                  //     width: double.infinity,
                  //     color: Color(0xffffffff),
                  //     child:Container()
                  // )
              )
          )


      ),
            
          ],
        ),

      ),
    );
  }

  Widget buildText(String text, {TextStyle, style}){

    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible: TextOverflow.ellipsis,
    );
  }
}