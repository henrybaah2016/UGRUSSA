import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ugrussa/chat/chat_list.dart';


class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color (0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xff072e79),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatList()),
                    );
                  },
                  child:Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xffffffff),
                    size: 24.0,
                  ),
                )
              );
            },
          ),
          title: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Francis Grant',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.call,
              color: Color(0xffffffff),
              size: 20.0,
            ),
            PopupMenuButton(

              onSelected: (result) async {
                if (result == 0) {
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(
                Icons.search,
                color: Color(0xffffffff),
                size: 24.0,
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
            PopupMenuButton(
              onSelected: (result) async {
                if(result == 0){
                  Navigator.of(context).pop();
                }

              },

              icon:const Icon(

                Icons.more_vert_outlined,
                color: Color(0xffffffff),
                size: 24.0,


              ),
              offset: Offset(0, kToolbarHeight),

              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child:Padding(
                    padding: EdgeInsets.only(left:8.0,right: 25),
                    child: Text('Logout',style: TextStyle(color: Color(0xff3e3956), fontSize: 20,fontWeight: FontWeight.w400),),
                  ),
                  value: 0,
                ),

              ],
            ),

          ],
        ),
        body: Stack(
          children: <Widget>[
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left:10,right:10,bottom:10),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        width:200,
                        margin: const EdgeInsets.only(bottom: 0,right:10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffffffff)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Color(0xffffffff)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color:Color(0xffffffff)),
                            ),
                            hintText: 'Type your message',
                            hintStyle: TextStyle(color: Color(0xffe4e4e4),fontSize: 16, fontWeight: FontWeight.w600),
                            contentPadding: EdgeInsets.only(bottom: 0,left:10),

                          ),
                        ),
                      ),

                      Container(
                          alignment: Alignment.bottomRight,
                          margin:EdgeInsets.only(bottom:5),
                          child:Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child:Icon(
                                      Icons.attach_file_rounded,
                                      size:24,
                                      color:Color(0xff072e79)
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child:Icon(
                                      Icons.mood,
                                      size:24,
                                      color:Color(0xff072e79)
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child:Icon(
                                      Icons.send,
                                      size:24,
                                      color:Color(0xff072e79)
                                  )
                              ),

                            ],
                          )
                      )
                    ],

                  ),
                )

            ),
            Container(

              child: Container(
                  width: double.infinity,
                  child:Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:10),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top:10,left: 10,right: 5),
                                alignment:Alignment.center,

                                child:ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      width:50,
                                      child: Image.asset('assets/images/use_profile.png')
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:8,bottom: 8,left: 8),
                                          child:  Text('12:03',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 14, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                        )
                                    ),
                                    Container(
                                        child:Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child:Padding(
                                                  padding: const EdgeInsets.only(right:5,bottom:20),
                                                  child: Icon(
                                                      Icons.circle,
                                                      size: 7,
                                                      color:Color(0xffB3B3B3)
                                                  )

                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffe4e4e4),
                                                    border: Border.all(
                                                      color: Color(0xffe4e4e4),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child:  Text('hello Goodmorning',style: TextStyle(color: Color(0xff868484), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                                )
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],

                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top:30),
                          child: Row(
                            children: [
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [

                                  Container(

                                      child: Padding(
                                        padding: const EdgeInsets.only(top:8,bottom: 8,right: 20),
                                        child:  Text('12:03',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 14, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                      )
                                  ),
                                  Container(
                                      child:Row(
                                        children: [

                                          Container(

                                              decoration: BoxDecoration(
                                                  color: Color(0xff072e79),
                                                  border: Border.all(
                                                    color: Color(0xff072e79),
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child:  Text('Hi!',style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                              )
                                          ),
                                          Container(
                                            child:Padding(
                                                padding: const EdgeInsets.only(right:5,bottom:20,left: 8),
                                                child: Icon(
                                                    Icons.circle,
                                                    size: 7,
                                                    color:Color(0xff072e79)
                                                )

                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top:10,left: 10,right: 5),
                                alignment:Alignment.center,

                                child:ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      width:50,
                                      child: Image.asset('assets/images/use_profile.png')
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:8,bottom: 8,left: 8),
                                          child:  Text('12:03',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 14, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                        )
                                    ),
                                    Container(
                                        child:Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child:Padding(
                                                  padding: const EdgeInsets.only(right:5,bottom:20),
                                                  child: Icon(
                                                      Icons.circle,
                                                      size: 7,
                                                      color:Color(0xffB3B3B3)
                                                  )

                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffe4e4e4),
                                                    border: Border.all(
                                                      color: Color(0xffe4e4e4),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child:  Text('Please can I have a file sent to you',style: TextStyle(color: Color(0xff868484), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                                )
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],

                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top:30),
                          child: Row(
                            children: [
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [

                                  Container(

                                      child: Padding(
                                        padding: const EdgeInsets.only(top:8,bottom: 8,right: 20),
                                        child:  Text('12:03',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 14, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                      )
                                  ),
                                  Container(
                                      child:Row(
                                        children: [

                                          Container(

                                              decoration: BoxDecoration(
                                                  color: Color(0xff072e79),
                                                  border: Border.all(
                                                    color: Color(0xff072e79),
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child:  Text('ok I will do that',style: TextStyle(color: Color(0xffffffff), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                              )
                                          ),
                                          Container(
                                            child:Padding(
                                                padding: const EdgeInsets.only(right:5,bottom:20,left: 8),
                                                child: Icon(
                                                    Icons.circle,
                                                    size: 7,
                                                    color:Color(0xff072e79)
                                                )

                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top:10,left: 10,right: 5),
                                alignment:Alignment.center,

                                child:ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                      width:50,
                                      child: Image.asset('assets/images/use_profile.png')
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:8,bottom: 8,left: 8),
                                          child:  Text('12:03',style: TextStyle(color: Color(0xffB3B3B3), fontSize: 14, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                        )
                                    ),
                                    Container(
                                        child:Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child:Padding(
                                                  padding: const EdgeInsets.only(right:5,bottom:20),
                                                  child: Icon(
                                                      Icons.circle,
                                                      size: 7,
                                                      color:Color(0xffB3B3B3)
                                                  )

                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffe4e4e4),
                                                    border: Border.all(
                                                      color: Color(0xffe4e4e4),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child:  Text('Ok, thanks!',style: TextStyle(color: Color(0xff868484), fontSize: 16, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,),

                                                )
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],

                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),

          ],
        )
    );


  }

}
