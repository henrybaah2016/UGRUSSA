import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ugrussa/dues/pay.dart';

import '../student/details.dart';


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
                  height: 240,
                    width: double.infinity,
                  color: Color(0xff072e79),
                    child: Container(
                      margin:EdgeInsets.only(top:10),
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
                      ),
                    )


                ),

                Container(
                    width: double.infinity,
                    color: Color(0xffffffff),
                    child:Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(top:50,bottom: 2,left:20,right:10),
                          child:Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left:10),
                                alignment: Alignment.topLeft,
                                child: Text('Payment Method',style: TextStyle(color: Color(0xff3c4043), fontSize: 18, fontWeight: FontWeight.w600),),


                              ),
                              Container(
                                child:Row(
                                  children: [

                                    Container(
                                      width:70,
                                      height:70,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('assets/images/visa-icon.png'),
                                      ),
                                    ),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PayPage()),
                                    );
                                  },
                                  child:Container(
                                    margin: const EdgeInsets.only(left:8.0),
                                    child: DottedBorder(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                      child:  Container(

                                        child: Padding(
                                          padding: const EdgeInsets.only(left:13,right:13,top:3,bottom:3),
                                          child: Icon(
                                            Icons.add_outlined,
                                            size:24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                )

                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),

                        Container(
                          margin: EdgeInsets.only(top:1,bottom: 2,left:20,right:10),
                          child:Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom:10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left:10),
                                      alignment: Alignment.topLeft,
                                      child: Text('Dues History',style: TextStyle(color: Color(0xff3c4043), fontSize: 18, fontWeight: FontWeight.w600),),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PayPage()),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left:10,right:13),
                                        alignment: Alignment.topLeft,
                                        child:Icon(
                                          Icons.add_circle_outline,
                                          size: 22,
                                          color: Color(0xff59b101),
                                        ),
                                      ),
                                    ),

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
                                                    EdgeInsets.only(top: 10, bottom: 5, left: 5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(100)),
                                                      child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          child: Image.asset(
                                                              'assets/images/use_profile.png')),
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
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                'GH50.00  ',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                '21/Oct/2022',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuButton(
                                              icon: Icon(
                                                Icons.check_circle,
                                                size: 24,
                                                color: Color(0xff59b101),
                                              ),
                                              itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                                const PopupMenuItem(
                                                  child: ListTile(
                                                    title: Text('Paid'),
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
                                                    EdgeInsets.only(top: 10, bottom: 5, left: 5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(100)),
                                                      child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          child: Image.asset(
                                                              'assets/images/use_profile.png')),
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
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                'GH50.00  ',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                '21/Oct/2022',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuButton(
                                              icon: Icon(
                                                Icons.check_circle,
                                                size: 24,
                                                color: Color(0xff59b101),
                                              ),
                                              itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                                const PopupMenuItem(
                                                  child: ListTile(
                                                    title: Text('Paid'),
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
                                                    EdgeInsets.only(top: 10, bottom: 5, left: 5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(100)),
                                                      child: Container(
                                                          height: 45,
                                                          width: 45,
                                                          child: Image.asset(
                                                              'assets/images/use_profile.png')),
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
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                'GH50.00  ',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.all(1),
                                                              child: Text(
                                                                '21/Oct/2022',
                                                                style: TextStyle(
                                                                    color: Color(0xffc8cbcd),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight.w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuButton(
                                              icon: Icon(
                                                Icons.check_circle,
                                                size: 24,
                                                color: Color(0xff59b101),
                                              ),
                                              itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry>[
                                                const PopupMenuItem(
                                                  child: ListTile(
                                                    title: Text('Paid'),
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


                            ],
                          ),


                        ),

                      ],
                    )


                ),

              ],
            ),

            new Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .11,
                  right: 10.0,
                  left: 10.0),
              child: new Card(
                child:Container(
                    alignment:Alignment.topLeft,
                    height: 200,
                    width: double.infinity,
                    color: Color(0xffffffff),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:70,
                                height:70,
                                margin:EdgeInsets.only(left:10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/chip-icon.png'),
                                ),
                              ),

                              Container(
                                width:70,
                                height:70,
                                margin:EdgeInsets.only(left:10,right:10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/visa-icon.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:15),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:EdgeInsets.only(left:10),
                                child: Padding(
                                  padding: const EdgeInsets.only(right:8.0,bottom:4,left:8),
                                  child: Text('CARD NUMBER',style: TextStyle(color: Color(0xffbdb9b9), fontSize: 12, fontWeight: FontWeight.w600),),
                                ),
                              ),

                              Container(
                                margin:EdgeInsets.only(left:10,right:10),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text('5434 - 4344 - 3433 - 8787',style: TextStyle(color: Color(0xff3c4043), fontSize: 18, fontWeight: FontWeight.w600),),
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
                                margin:EdgeInsets.only(top:20),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(left:10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8.0,bottom:4,left:8),
                                        child: Text('CARD NAME',style: TextStyle(color: Color(0xffbdb9b9), fontSize: 12, fontWeight: FontWeight.w600),),
                                      ),
                                    ),

                                    Container(
                                      margin:EdgeInsets.only(left:10,right:10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text('Mark Gyan',style: TextStyle(color: Color(0xff3c4043), fontSize: 18, fontWeight: FontWeight.w600),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin:EdgeInsets.only(top:20),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(left:10,right:10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8.0,bottom:4,left:8),
                                        child: Text('CARD EXPIRY',style: TextStyle(color: Color(0xffbdb9b9), fontSize: 12, fontWeight: FontWeight.w600),),
                                      ),
                                    ),

                                    Container(
                                      margin:EdgeInsets.only(left:10,right:10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text('31/Dec',style: TextStyle(color: Color(0xff3c4043), fontSize: 18, fontWeight: FontWeight.w600),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                ),
              )
            )
          ],
        ),

      ),
    );
  }
}