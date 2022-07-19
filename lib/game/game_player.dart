import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/game/game_board.dart';

final List<String> imgList = [
  'assets/images/cartoon_male.png',
  'assets/images/cartoon_female.png'
];
class GamePlayer extends StatefulWidget {
  GamePlayer({Key? key}) : super(key: key);

  @override
  _GamePlayerState createState() => _GamePlayerState();


}

class _GamePlayerState extends State<GamePlayer> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xbe072e79),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,



        ),

        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,

                        ),
                        items: imgList
                            .map((item) => Container(
                          child: Center(
                              child:
                              Image.asset(item, fit: BoxFit.contain, )),
                        ))
                            .toList(),
                      )),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                      child: new Text('Choose your \nCharacter',
                        style: TextStyle(color: Color(0xffffffff),fontSize: 30,fontWeight: FontWeight.w700),),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: new Text('play the educative puzzle game to \nlearn new Russian words',
                        style: TextStyle(color: Color(0xffffffff),fontSize: 18,fontWeight: FontWeight.normal),),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, right: 20),
                  child: Row(

                    children: [
                      Container(
                        margin: EdgeInsets.only(right:20,left:20),
                        child: const Icon(

                          Icons.arrow_forward_outlined,
                          color: Color(0xffffffff),
                          size: 25.0,


                        ),
                      ),
                      Container(
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //primary: Color(0xff072e79),
                            primary:Color(0xff3bd854),

                            minimumSize: Size(double.infinity, 52),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(100.0),
                              // side: BorderSide(color: Color(0xffffffff)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GameBoard()),
                            );
                          },
                          child: new Text('Next',
                            style: TextStyle(color: Color(0xffffffff),fontSize: 18),),

                        ),
                      ),
                    ],
                  ),
                ),


              ]
          ),
        )
    );
  }
}