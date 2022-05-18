import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/game/game_player.dart';
import 'package:ugrussa/game/game_score.dart';

class GameBoard extends StatefulWidget {
  GameBoard({Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();


}

class _GameBoardState extends State<GameBoard>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isButtonPressedOne = false;
  bool isButtonPressedTwo = false;
  bool isButtonPressedThree = false;
  bool isButtonPressedFour = false;
  bool isButtonPressedFive = false;
  bool isButtonPressedSix = false;
  bool isButtonPressedSeven = false;
  bool isButtonPressedEight = false;
  bool isButtonPressedNine = false;
  bool isButtonPressedTen = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xbe072e79),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,


          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) async {
                if(result == 0){
                  Navigator.of(context).pop();
                }

              },


              icon:Container(
                margin: EdgeInsets.only(right:20),
                child: const Icon(

                  Icons.close_rounded,
                  color: Color(0xffffffff),
                  size: 25.0,


                ),
              ),
              offset: Offset(0, kToolbarHeight),

              itemBuilder: (BuildContext context) => <PopupMenuEntry>[


              ],
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                LinearProgressIndicator(
                  //value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                  color: Color(0xff3bd854),
                  backgroundColor: Color(0xff073ea6),
                ),
                // LinearProgressIndicator(
                //     {Key? key,
                //       double? value,
                //       color: backgroundColor,
                //       Color? color,
                //       Animation<Color?>? valueColor,
                //       double? minHeight,
                //       String? semanticsLabel,
                //       String? semanticsValue}
                // )
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                        MaterialPageRoute(builder: (context) => GameScore()),
                      );
                    },
                    child: new Text('Match Words',
                      style: TextStyle(color: Color(0xffffffff),fontSize: 18),),

                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top:10,left:10,right:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('Food',
                                style: TextStyle(color: isButtonPressedOne ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedOne ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                // side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedOne =!isButtonPressedOne;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('tkan',
                                style: TextStyle(color: isButtonPressedTwo ? Color(0xfffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedTwo ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                //side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedTwo =!isButtonPressedTwo;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10,left:10,right:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('Yeda',
                                style: TextStyle(color: isButtonPressedThree ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedThree ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                // side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedThree =!isButtonPressedThree;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('Cloth',
                                style: TextStyle(color: isButtonPressedFour ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedFour ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                //side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedFour =!isButtonPressedFour;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10,left:10,right:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('kniga',
                                style: TextStyle(color: isButtonPressedFive ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedFive ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                // side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedFive =!isButtonPressedFive;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('Pen',
                                style: TextStyle(color: isButtonPressedSix ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedSix ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                //side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedSix =!isButtonPressedSix;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10,left:10,right:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('ruchka',
                                style: TextStyle(color: isButtonPressedSeven ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedSeven ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                // side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedSeven =!isButtonPressedSeven;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('Book',
                                style: TextStyle(color: isButtonPressedEight ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedEight ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                //side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedEight =!isButtonPressedEight;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10,left:10,right:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('novyy',
                                style: TextStyle(color: isButtonPressedNine ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedNine ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                // side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedNine =!isButtonPressedNine;
                              });
                            },
                          ),
                        ),
                      ),

                      Expanded(

                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new ElevatedButton(

                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),

                              child: new Text('New',
                                style: TextStyle(color: isButtonPressedTen ? Color(0xffffffff) : Color(0xff073ea6),fontSize: 18),),
                            ),

                            style: ElevatedButton.styleFrom(
                              //primary: Color(0xff072e79),
                              primary: isButtonPressedTen ? Color(0xff073ea6) : Color(0xffffffff),

                              minimumSize: Size(double.infinity, 52),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                                //side: BorderSide(color: Color(0xffffffff)),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isButtonPressedTen =!isButtonPressedTen;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: new Text('I don\'t know',
                    style: TextStyle(color: Color(0xff3bd854),fontSize: 18,letterSpacing: 2),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:80.0,right:80.0),
                  child: LinearProgressIndicator(
                    //value: controller.value,
                    color: Color(0xff3bd854),
                    backgroundColor: Color(0xff073ea6),
                  ),
                ),

              ]
          ),
        )
    );
  }
}