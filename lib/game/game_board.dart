import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_wizard/multi_wizard.dart';
import 'package:ugrussa/game/game_player.dart';
import 'package:ugrussa/game/game_score.dart';

class GameBoard extends StatefulWidget {
  final int stage;

  GameBoard({Key? key, required this.stage}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> with TickerProviderStateMixin {
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

  bool isButtonPressedEleven = false;
  bool isButtonPressedTwelve = false;
  bool isButtonPressedThirteen = false;
  bool isButtonPressedFourteen = false;
  bool isButtonPressedFifteen = false;
  bool isButtonPressedSixteen = false;
  bool isButtonPressedSeventeen = false;
  bool isButtonPressedEighteen = false;
  bool isButtonPressedNineteen = false;
  bool isButtonPressedTwenty = false;

  bool isButtonPressedTwentyOne = false;
  bool isButtonPressedTwentyTwo = false;
  bool isButtonPressedTwentyThree = false;
  bool isButtonPressedTwentyFour = false;
  bool isButtonPressedTwentyFive = false;
  bool isButtonPressedTwentySix = false;
  bool isButtonPressedTwentySeven = false;
  bool isButtonPressedTwentyEight = false;
  bool isButtonPressedTwentyNine = false;
  bool isButtonPressedThirty = false;

  bool isButtonPressedThirtyOne = false;
  bool isButtonPressedThirtyTwo = false;
  bool isButtonPressedThirtyThree = false;
  bool isButtonPressedThirtyFour = false;
  bool isButtonPressedThirtyFive = false;
  bool isButtonPressedThirtySix = false;
  bool isButtonPressedThirtySeven = false;
  bool isButtonPressedThirtyEight = false;
  bool isButtonPressedThirtyNine = false;
  bool isButtonPressedForty = false;

  bool isButtonPressedFortyOne = false;
  bool isButtonPressedFortyTwo = false;
  bool isButtonPressedFortyThree = false;
  bool isButtonPressedFortyFour = false;
  bool isButtonPressedFortyFive = false;

  int score = 0;
  int chances = 5;

  Color matchOneColor = Colors.blue;
  Color matchTwoColor = Colors.green;
  Color matchThreeColor = Colors.purple;
  Color matchFourColor = Colors.pink;
  Color matchFiveColor = Colors.red;

  String one = "";
  String two = "";
  String three = "";
  String four = "";
  String five = "";
  String six = "";
  String seven = "";
  String eight = "";
  String nine = "";
  String ten = "";

  List<Map<String, String>> _answers = [
    {"Food": "tkan"},
    {"Yeda": "Cloth"},
    {"kniga": "Pen"},
    {"ruchka": "Book"},
    {"novyy": "new"},
  ];

  _checkAnswers() {
    _answers.asMap().map((key, value) {
      print("KEY : ${value.keys}   ::: VALUE : ${value.values}");

      return MapEntry(key, value);
    });
  }

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

  bool isOneMatch = false;
  bool isTwoMatch = false;
  bool isThreeMatch = false;
  bool isFourMatch = false;
  bool isFiveMatch = false;
  bool isSixMatch = false;
  bool isSevenMatch = false;
  bool isEightMatch = false;
  bool isNineMatch = false;
  bool isTenMatch = false;

  bool isElevenMatch = false;
  bool isTwelveMatch = false;
  bool isThirteenMatch = false;
  bool isFourteenMatch = false;
  bool isFifteenMatch = false;
  bool isSixteenMatch = false;
  bool isSeventeenMatch = false;
  bool isEighteenMatch = false;
  bool isNineteenMatch = false;
  bool isTwentyMatch = false;

  bool isTwentyOneMatch = false;
  bool isTwentyTwoMatch = false;
  bool isTwentyThreeMatch = false;
  bool isTwentyFourMatch = false;
  bool isTwentyFiveMatch = false;
  bool isTwentySixMatch = false;
  bool isTwentySevenMatch = false;
  bool isTwentyEightMatch = false;
  bool isTwentyNineMatch = false;
  bool isThirtyMatch = false;

  bool isThirtyOneMatch = false;
  bool isThirtyTwoMatch = false;
  bool isThirtyThreeMatch = false;
  bool isThirtyFourMatch = false;
  bool isThirtyFiveMatch = false;
  bool isThirtySixMatch = false;
  bool isThirtySevenMatch = false;
  bool isThirtyEightMatch = false;
  bool isThirtyNineMatch = false;
  bool isFortyMatch = false;

  bool isFortyOneMatch = false;
  bool isFortyTwoMatch = false;
  bool isFortyThreeMatch = false;
  bool isFortyFourMatch = false;
  bool isFortyFiveMatch = false;

  bool isOneColorRed = false;
  bool isTwoColorRed = false;
  bool isThreeColorRed = false;
  bool isFourColorRed = false;
  bool isFiveColorRed = false;
  bool isSixColorRed = false;
  bool isSevenColorRed = false;
  bool isEightColorRed = false;
  bool isNineColorRed = false;
  bool isTenColorRed = false;

  bool isElevenColorRed = false;
  bool isTwelveColorRed = false;
  bool isThirteenColorRed = false;
  bool isFourteenColorRed = false;
  bool isFifteenColorRed = false;
  bool isSixteenColorRed = false;
  bool isSeventeenColorRed = false;
  bool isEighteenColorRed = false;
  bool isNineteenColorRed = false;
  bool isTwentyColorRed = false;

  bool isTwentyOneColorRed = false;
  bool isTwentyTwoColorRed = false;
  bool isTwentyThreeColorRed = false;
  bool isTwentyFourColorRed = false;
  bool isTwentyFiveColorRed = false;
  bool isTwentySixColorRed = false;
  bool isTwentySevenColorRed = false;
  bool isTwentyEightColorRed = false;
  bool isTwentyNineColorRed = false;
  bool isThirtyColorRed = false;

  bool isThirtyOneColorRed = false;
  bool isThirtyTwoColorRed = false;
  bool isThirtyThreeColorRed = false;
  bool isThirtyFourColorRed = false;
  bool isThirtyFiveColorRed = false;
  bool isThirtySixColorRed = false;
  bool isThirtySevenColorRed = false;
  bool isThirtyEightColorRed = false;
  bool isThirtyNineColorRed = false;
  bool isFortyColorRed = false;

  bool isFortyOneColorRed = false;
  bool isFortyTwoColorRed = false;
  bool isFortyThreeColorRed = false;
  bool isFortyFourColorRed = false;
  bool isFortyFiveColorRed = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _choices = [
      {one: two},
      {three: four},
      {five: six},
      {seven: eight},
      {nine: ten},
    ];
    return Scaffold(
      backgroundColor: Color(0xbe072e79),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) async {
              if (result == 0) {
                Navigator.of(context).pop();
              }
            },
            icon: Container(
              margin: EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xffffffff),
                size: 25.0,
              ),
            ),
            offset: Offset(0, kToolbarHeight),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: widget.stage == 8 && chances == 1 || chances == 0
            ? AlertDialog(
                title: Text("Game Over"),
                content: Text(''),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScore(
                            score: score,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        "Check your score",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
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
                        primary: Color(0xff3bd854),

                        minimumSize: Size(double.infinity, 52),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                          // side: BorderSide(color: Color(0xffffffff)),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => GameScore()),
                        // );
                        // _checkAnswers();
                      },
                      child: new Text(
                        'Match Words - Stage ${widget.stage}',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 18),
                      ),
                    ),
                  ),

                  widget.stage == 1
                      ? Column(children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!isThreeMatch && !isThreeColorRed)
                                  Expanded(
                                    child: Draggable(
                                      data: "3",
                                      feedback: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Целоваться',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize: Size(150, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      childWhenDragging: Container(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Целоваться',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize:
                                                Size(double.infinity, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isThreeMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Целоваться',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isThreeColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Целоваться',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (!isOneMatch && !isOneColorRed)
                                  Expanded(
                                    child: DragTarget(
                                      builder: (context,
                                          List<Object?> candidateData,
                                          rejectedData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'to smile',
                                                style: TextStyle(
                                                  color: Color(0xff073ea6),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Color(0xffffffff),

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        print("data $data");
                                        setState(() {
                                          if (data == "1") {
                                            isOneMatch = true;
                                            score += 10;
                                            chances -= 1;

                                            print("CHANCES $chances");
                                          } else {
                                            if (score > 0) {
                                              score -= 5;
                                            }
                                            isOneColorRed = true;
                                            chances -= 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                if (isOneMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'to smile',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isOneColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'to smile',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          //two
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!isTwoMatch && !isTwoColorRed)
                                  Expanded(
                                    child: Draggable(
                                      data: "2",
                                      feedback: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Привет',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize: Size(150, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      childWhenDragging: Container(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Привет',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize:
                                                Size(double.infinity, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isTwoMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Привет',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isTwoColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Привет',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (!isTwoMatch && !isTwoColorRed)
                                  Expanded(
                                    child: DragTarget(
                                      builder: (context,
                                          List<Object?> candidateData,
                                          rejectedData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'hello',
                                                style: TextStyle(
                                                  color: Color(0xff073ea6),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Color(0xffffffff),

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        print("data $data");
                                        setState(() {
                                          if (data == "2") {
                                            isTwoMatch = true;
                                            score += 10;
                                            chances -= 1;
                                            print("CHANCES $chances");
                                          } else {
                                            if (score > 0) {
                                              score -= 5;
                                            }
                                            isTwoColorRed = true;
                                            chances -= 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                if (isTwoMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'hello',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isTwoColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'hello',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          //3
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!isOneMatch && !isOneColorRed)
                                  Expanded(
                                    child: Draggable(
                                      data: "1",
                                      feedback: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Улыбаться',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize: Size(150, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      childWhenDragging: Container(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Улыбаться',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize:
                                                Size(double.infinity, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isOneMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Улыбаться',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isOneColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Улыбаться',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (!isThreeMatch && !isThreeColorRed)
                                  Expanded(
                                    child: DragTarget(
                                      builder: (context,
                                          List<Object?> candidateData,
                                          rejectedData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'to kiss each other',
                                                style: TextStyle(
                                                  color: Color(0xff073ea6),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Color(0xffffffff),

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        print("data $data");
                                        setState(() {
                                          if (data == "3") {
                                            isThreeMatch = true;
                                            score += 10;
                                            chances -= 1;
                                            print("CHANCES $chances");
                                          } else {
                                            if (score > 0) {
                                              score -= 5;
                                            }
                                            isThreeColorRed = true;
                                            chances -= 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                if (isThreeMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'to kiss each other',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isThreeColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'to kiss each other',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          //4
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!isFiveMatch && !isFiveColorRed)
                                  Expanded(
                                    child: Draggable(
                                      data: "5",
                                      feedback: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Да',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize: Size(150, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      childWhenDragging: Container(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Да',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize:
                                                Size(double.infinity, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isFiveMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Да',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isFiveColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Да',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (!isFourMatch && !isFourColorRed)
                                  Expanded(
                                    child: DragTarget(
                                      builder: (context,
                                          List<Object?> candidateData,
                                          rejectedData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'hapiness',
                                                style: TextStyle(
                                                  color: Color(0xff073ea6),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Color(0xffffffff),

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        print("data $data");
                                        setState(() {
                                          if (data == "4") {
                                            isFourMatch = true;
                                            score += 10;
                                            chances -= 1;
                                            print("CHANCES $chances");
                                          } else {
                                            if (score > 0) {
                                              score -= 5;
                                            }
                                            isFourColorRed = true;
                                            chances -= 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                if (isFourMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'hapiness',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isFourColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'hapiness',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          //5
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!isFourMatch && !isFourColorRed)
                                  Expanded(
                                    child: Draggable(
                                      data: "4",
                                      feedback: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Радость',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize: Size(150, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      childWhenDragging: Container(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new ElevatedButton(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: new Text(
                                              'Радость',
                                              style: TextStyle(
                                                color: Color(0xff073ea6),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            //primary: Color(0xff072e79),
                                            primary: Color(0xffffffff),

                                            minimumSize:
                                                Size(double.infinity, 52),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      100.0),
                                              // side: BorderSide(color: Color(0xffffffff)),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isFourMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Радость',
                                            style: TextStyle(
                                              // color: Colors.green,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isFourColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'Радость',
                                            style: TextStyle(
                                              // color: Colors.green,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (!isFiveMatch && !isFiveColorRed)
                                  Expanded(
                                    child: DragTarget(
                                      builder: (context,
                                          List<Object?> candidateData,
                                          rejectedData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'yes',
                                                style: TextStyle(
                                                  color: Color(0xff073ea6),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Color(0xffffffff),

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      onWillAccept: (data) {
                                        return true;
                                      },
                                      onAccept: (data) {
                                        print("data $data");
                                        setState(() {
                                          if (data == "5") {
                                            isFiveMatch = true;
                                            score += 10;
                                            chances -= 1;
                                            print("CHANCES $chances");
                                          } else {
                                            if (score > 0) {
                                              score -= 5;
                                            }
                                            isFiveColorRed = true;
                                            chances -= 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                if (isFiveMatch)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'yes',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.green,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                if (isFiveColorRed)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new ElevatedButton(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: new Text(
                                            'yes',
                                            style: TextStyle(
                                              // color: Colors.transparent,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          //primary: Color(0xff072e79),
                                          primary: Colors.red,

                                          minimumSize:
                                              Size(double.infinity, 52),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            // side: BorderSide(color: Color(0xffffffff)),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ])
                      : widget.stage == 2
                          ? Column(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!isNineMatch && !isNineColorRed)
                                      Expanded(
                                        child: Draggable(
                                          data: "9",
                                          feedback: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Россиянин',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize: Size(150, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          childWhenDragging: Container(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Россиянин',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize:
                                                    Size(double.infinity, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isNineMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Россиянин',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isNineColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Россиянин',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (!isSixMatch && !isSixColorRed)
                                      Expanded(
                                        child: DragTarget(
                                          builder: (context,
                                              List<Object?> candidateData,
                                              rejectedData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Goodbye',
                                                    style: TextStyle(
                                                      color: Color(0xff073ea6),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Color(0xffffffff),

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("data $data");
                                            setState(() {
                                              if (data == "6") {
                                                isSixMatch = true;
                                                score += 10;
                                                chances -= 1;

                                                print("CHANCES $chances");
                                              } else {
                                                if (score > 0) {
                                                  score -= 5;
                                                }
                                                isSixColorRed = true;
                                                chances -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    if (isSixMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Goodbye',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isSixColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Goodbye',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              //2
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!isSevenMatch && !isSevenColorRed)
                                      Expanded(
                                        child: Draggable(
                                          data: "7",
                                          feedback: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Вдохновение',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize: Size(150, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          childWhenDragging: Container(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Вдохновение',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize:
                                                    Size(double.infinity, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isSevenMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Вдохновение',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isSevenColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Вдохновение',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (!isNineMatch && !isNineColorRed)
                                      Expanded(
                                        child: DragTarget(
                                          builder: (context,
                                              List<Object?> candidateData,
                                              rejectedData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Russian',
                                                    style: TextStyle(
                                                      color: Color(0xff073ea6),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Color(0xffffffff),

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("data $data");
                                            setState(() {
                                              if (data == "9") {
                                                isNineMatch = true;
                                                score += 10;
                                                chances -= 1;
                                                print("CHANCES $chances");
                                              } else {
                                                if (score > 0) {
                                                  score -= 5;
                                                }
                                                isNineColorRed = true;
                                                chances -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    if (isNineMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Russian',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isNineColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Russian',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              //3
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!isEightMatch && !isEightColorRed)
                                      Expanded(
                                        child: Draggable(
                                          data: "8",
                                          feedback: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Палисадник',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize: Size(150, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          childWhenDragging: Container(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Палисадник',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize:
                                                    Size(double.infinity, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isEightMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Палисадник',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isEightColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Палисадник',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (!isSevenMatch && !isSevenColorRed)
                                      Expanded(
                                        child: DragTarget(
                                          builder: (context,
                                              List<Object?> candidateData,
                                              rejectedData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Inspiration',
                                                    style: TextStyle(
                                                      color: Color(0xff073ea6),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Color(0xffffffff),

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("data $data");
                                            setState(() {
                                              if (data == "7") {
                                                isSevenMatch = true;
                                                score += 10;
                                                chances -= 1;
                                                print("CHANCES $chances");
                                              } else {
                                                if (score > 0) {
                                                  score -= 5;
                                                }
                                                isSevenColorRed = true;
                                                chances -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    if (isSevenMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Inspiration',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isSevenColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Inspiration',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              //4
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!isTenMatch && !isTenColorRed)
                                      Expanded(
                                        child: Draggable(
                                          data: "10",
                                          feedback: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Бумагa',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize: Size(150, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          childWhenDragging: Container(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'Бумагa',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize:
                                                    Size(double.infinity, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isTenMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Бумагa',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isTenColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Бумагa',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (!isEightMatch && !isEightColorRed)
                                      Expanded(
                                        child: DragTarget(
                                          builder: (context,
                                              List<Object?> candidateData,
                                              rejectedData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Front garden',
                                                    style: TextStyle(
                                                      color: Color(0xff073ea6),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Color(0xffffffff),

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("data $data");
                                            setState(() {
                                              if (data == "8") {
                                                isEightMatch = true;
                                                score += 10;
                                                chances -= 1;
                                                print("CHANCES $chances");
                                              } else {
                                                if (score > 0) {
                                                  score -= 5;
                                                }
                                                isEightColorRed = true;
                                                chances -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    if (isEightMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Front garden',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isEightColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'Front garden',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              //5
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!isSixMatch && !isSixColorRed)
                                      Expanded(
                                        child: Draggable(
                                          data: "6",
                                          feedback: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'До свидания',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize: Size(150, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          childWhenDragging: Container(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new ElevatedButton(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: new Text(
                                                  'До свидания',
                                                  style: TextStyle(
                                                    color: Color(0xff073ea6),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                //primary: Color(0xff072e79),
                                                primary: Color(0xffffffff),

                                                minimumSize:
                                                    Size(double.infinity, 52),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isSixMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'До свидания',
                                                style: TextStyle(
                                                  // color: Colors.green,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isSixColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'До свидания',
                                                style: TextStyle(
                                                  // color: Colors.green,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (!isTenMatch && !isTenColorRed)
                                      Expanded(
                                        child: DragTarget(
                                          builder: (context,
                                              List<Object?> candidateData,
                                              rejectedData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'рaрег',
                                                    style: TextStyle(
                                                      color: Color(0xff073ea6),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Color(0xffffffff),

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            );
                                          },
                                          onWillAccept: (data) {
                                            return true;
                                          },
                                          onAccept: (data) {
                                            print("data $data");
                                            setState(() {
                                              if (data == "10") {
                                                isTenMatch = true;
                                                score += 10;
                                                chances -= 1;
                                                print("CHANCES $chances");
                                              } else {
                                                if (score > 0) {
                                                  score -= 5;
                                                }
                                                isTenColorRed = true;
                                                chances -= 1;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    if (isTenMatch)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'рaрег',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.green,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    if (isTenColorRed)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new ElevatedButton(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              child: new Text(
                                                'рaрег',
                                                style: TextStyle(
                                                  // color: Colors.transparent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              //primary: Color(0xff072e79),
                                              primary: Colors.red,

                                              minimumSize:
                                                  Size(double.infinity, 52),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        100.0),
                                                // side: BorderSide(color: Color(0xffffffff)),
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ])
                          : widget.stage == 3
                              ? Column(children: [
                                  //1
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (!isTwelveMatch && !isTwelveColorRed)
                                          Expanded(
                                            child: Draggable(
                                              data: "12",
                                              feedback: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'бйстро',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(150, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              childWhenDragging: Container(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'бйстро',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(
                                                        double.infinity, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isTwelveMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'бйстро',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isTwelveColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'бйстро',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!isFifteenMatch &&
                                            !isFifteenColorRed)
                                          Expanded(
                                            child: DragTarget(
                                              builder: (context,
                                                  List<Object?> candidateData,
                                                  rejectedData) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'One million',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff073ea6),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary:
                                                          Color(0xffffffff),

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                );
                                              },
                                              onWillAccept: (data) {
                                                return true;
                                              },
                                              onAccept: (data) {
                                                print("data $data");
                                                setState(() {
                                                  if (data == "15") {
                                                    isFifteenMatch = true;
                                                    score += 10;
                                                    chances -= 1;

                                                    print("CHANCES $chances");
                                                  } else {
                                                    if (score > 0) {
                                                      score -= 5;
                                                    }
                                                    isFifteenColorRed = true;
                                                    chances -= 1;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        if (isFifteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'One million',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isFifteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'One million',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  //2
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (!isThirteenMatch &&
                                            !isThirteenColorRed)
                                          Expanded(
                                            child: Draggable(
                                              data: "13",
                                              feedback: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'быть',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(150, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              childWhenDragging: Container(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'быть',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(
                                                        double.infinity, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isThirteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'быть',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isThirteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'быть',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!isElevenMatch && !isElevenColorRed)
                                          Expanded(
                                            child: DragTarget(
                                              builder: (context,
                                                  List<Object?> candidateData,
                                                  rejectedData) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'banquet',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff073ea6),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary:
                                                          Color(0xffffffff),

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                );
                                              },
                                              onWillAccept: (data) {
                                                return true;
                                              },
                                              onAccept: (data) {
                                                print("data $data");
                                                setState(() {
                                                  if (data == "11") {
                                                    isElevenMatch = true;
                                                    score += 10;
                                                    chances -= 1;
                                                    print("CHANCES $chances");
                                                  } else {
                                                    if (score > 0) {
                                                      score -= 5;
                                                    }
                                                    isElevenColorRed = true;
                                                    chances -= 1;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        if (isElevenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'banquet',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isElevenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'banquet',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  //3
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (!isElevenMatch && !isElevenColorRed)
                                          Expanded(
                                            child: Draggable(
                                              data: "11",
                                              feedback: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'банкет',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(150, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              childWhenDragging: Container(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'банкет',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(
                                                        double.infinity, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isElevenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'банкет',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isElevenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'банкет',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!isThirteenMatch &&
                                            !isThirteenColorRed)
                                          Expanded(
                                            child: DragTarget(
                                              builder: (context,
                                                  List<Object?> candidateData,
                                                  rejectedData) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'To Ье',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff073ea6),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary:
                                                          Color(0xffffffff),

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                );
                                              },
                                              onWillAccept: (data) {
                                                return true;
                                              },
                                              onAccept: (data) {
                                                print("data $data");
                                                setState(() {
                                                  if (data == "13") {
                                                    isThirteenMatch = true;
                                                    score += 10;
                                                    chances -= 1;
                                                    print("CHANCES $chances");
                                                  } else {
                                                    if (score > 0) {
                                                      score -= 5;
                                                    }
                                                    isThirteenColorRed = true;
                                                    chances -= 1;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        if (isThirteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'To Ье',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isThirteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'To Ье',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  //4
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (!isFourteenMatch &&
                                            !isFourteenColorRed)
                                          Expanded(
                                            child: Draggable(
                                              data: "14",
                                              feedback: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'администратор',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(150, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              childWhenDragging: Container(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'администратор',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(
                                                        double.infinity, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isFourteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'администратор',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isFourteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'администратор',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!isTwelveMatch && !isTwelveColorRed)
                                          Expanded(
                                            child: DragTarget(
                                              builder: (context,
                                                  List<Object?> candidateData,
                                                  rejectedData) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'quickly',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff073ea6),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary:
                                                          Color(0xffffffff),

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                );
                                              },
                                              onWillAccept: (data) {
                                                return true;
                                              },
                                              onAccept: (data) {
                                                print("data $data");
                                                setState(() {
                                                  if (data == "12") {
                                                    isTwelveMatch = true;
                                                    score += 10;
                                                    chances -= 1;
                                                    print("CHANCES $chances");
                                                  } else {
                                                    if (score > 0) {
                                                      score -= 5;
                                                    }
                                                    isTwelveColorRed = true;
                                                    chances -= 1;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        if (isTwelveMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'quickly',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isTwelveColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'quickly',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  //5
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (!isFifteenMatch &&
                                            !isFifteenColorRed)
                                          Expanded(
                                            child: Draggable(
                                              data: "15",
                                              feedback: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'один миллион',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(150, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              childWhenDragging: Container(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new ElevatedButton(
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: new Text(
                                                      'один миллион',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff073ea6),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    //primary: Color(0xff072e79),
                                                    primary: Color(0xffffffff),

                                                    minimumSize: Size(
                                                        double.infinity, 52),
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(100.0),
                                                      // side: BorderSide(color: Color(0xffffffff)),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isFifteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'один миллион',
                                                    style: TextStyle(
                                                      // color: Colors.green,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isFifteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'один миллион',
                                                    style: TextStyle(
                                                      // color: Colors.green,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (!isFourteenMatch &&
                                            !isFourteenColorRed)
                                          Expanded(
                                            child: DragTarget(
                                              builder: (context,
                                                  List<Object?> candidateData,
                                                  rejectedData) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Administrator',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff073ea6),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary:
                                                          Color(0xffffffff),

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                );
                                              },
                                              onWillAccept: (data) {
                                                return true;
                                              },
                                              onAccept: (data) {
                                                print("data $data");
                                                setState(() {
                                                  if (data == "14") {
                                                    isFourteenMatch = true;
                                                    score += 10;
                                                    chances -= 1;
                                                    print("CHANCES $chances");
                                                  } else {
                                                    if (score > 0) {
                                                      score -= 5;
                                                    }
                                                    isFourteenColorRed = true;
                                                    chances -= 1;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        if (isFourteenMatch)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Administrator',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.green,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        if (isFourteenColorRed)
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new ElevatedButton(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: new Text(
                                                    'Administrator',
                                                    style: TextStyle(
                                                      // color: Colors.transparent,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  //primary: Color(0xff072e79),
                                                  primary: Colors.red,

                                                  minimumSize:
                                                      Size(double.infinity, 52),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(100.0),
                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ])
                              : widget.stage == 4
                                  ? Column(children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (!isSixteenMatch &&
                                                !isSixteenColorRed)
                                              Expanded(
                                                child: Draggable(
                                                  data: "16",
                                                  feedback: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'апельсйн',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize:
                                                            Size(150, 52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      Container(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'апельсйн',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize: Size(
                                                            double.infinity,
                                                            52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isSixteenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'апельсйн',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isSixteenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'апельсйн',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (!isTwentyMatch &&
                                                !isTwentyColorRed)
                                              Expanded(
                                                child: DragTarget(
                                                  builder: (context,
                                                      List<Object?>
                                                          candidateData,
                                                      rejectedData) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Currency exchange',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff073ea6),
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary:
                                                              Color(0xffffffff),

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    );
                                                  },
                                                  onWillAccept: (data) {
                                                    return true;
                                                  },
                                                  onAccept: (data) {
                                                    print("data $data");
                                                    setState(() {
                                                      if (data == "20") {
                                                        isTwentyMatch = true;
                                                        score += 10;
                                                        chances -= 1;

                                                        print(
                                                            "CHANCES $chances");
                                                      } else {
                                                        if (score > 0) {
                                                          score -= 5;
                                                        }
                                                        isTwentyColorRed = true;
                                                        chances -= 1;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            if (isTwentyMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Currency exchange',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isTwentyColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Currency exchange',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      //2
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (!isSeventeenMatch &&
                                                !isSeventeenColorRed)
                                              Expanded(
                                                child: Draggable(
                                                  data: "17",
                                                  feedback: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Туалет',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize:
                                                            Size(150, 52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      Container(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Туалет',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize: Size(
                                                            double.infinity,
                                                            52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isSeventeenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Туалет',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isSeventeenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Туалет',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (!isTwentyFourMatch &&
                                                !isTwentyFourColorRed)
                                              Expanded(
                                                child: DragTarget(
                                                  builder: (context,
                                                      List<Object?>
                                                          candidateData,
                                                      rejectedData) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Closed',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff073ea6),
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary:
                                                              Color(0xffffffff),

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    );
                                                  },
                                                  onWillAccept: (data) {
                                                    return true;
                                                  },
                                                  onAccept: (data) {
                                                    print("data $data");
                                                    setState(() {
                                                      if (data == "24") {
                                                        isTwentyFourMatch =
                                                            true;
                                                        score += 10;
                                                        chances -= 1;
                                                        print(
                                                            "CHANCES $chances");
                                                      } else {
                                                        if (score > 0) {
                                                          score -= 5;
                                                        }
                                                        isTwentyFourColorRed =
                                                            true;
                                                        chances -= 1;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            if (isTwentyFourMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Closed',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isTwentyFourColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Closed',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      //3
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (!isEighteenMatch &&
                                                !isEighteenColorRed)
                                              Expanded(
                                                child: Draggable(
                                                  data: "18",
                                                  feedback: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Информация',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize:
                                                            Size(150, 52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      Container(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Информация',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize: Size(
                                                            double.infinity,
                                                            52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isEighteenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Информация',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isEighteenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Информация',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (!isSixteenMatch &&
                                                !isSixteenColorRed)
                                              Expanded(
                                                child: DragTarget(
                                                  builder: (context,
                                                      List<Object?>
                                                          candidateData,
                                                      rejectedData) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'orange',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff073ea6),
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary:
                                                              Color(0xffffffff),

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    );
                                                  },
                                                  onWillAccept: (data) {
                                                    return true;
                                                  },
                                                  onAccept: (data) {
                                                    print("data $data");
                                                    setState(() {
                                                      if (data == "16") {
                                                        isSixteenMatch = true;
                                                        score += 10;
                                                        chances -= 1;
                                                        print(
                                                            "CHANCES $chances");
                                                      } else {
                                                        if (score > 0) {
                                                          score -= 5;
                                                        }
                                                        isSixteenColorRed =
                                                            true;
                                                        chances -= 1;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            if (isSixteenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'orange',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isSixteenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'orange',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      //4
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (!isNineteenMatch &&
                                                !isNineteenColorRed)
                                              Expanded(
                                                child: Draggable(
                                                  data: "19",
                                                  feedback: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Справка',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize:
                                                            Size(150, 52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      Container(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Справка',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize: Size(
                                                            double.infinity,
                                                            52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isNineteenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Справка',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isNineteenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Справка',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (!isSeventeenMatch &&
                                                !isSeventeenColorRed)
                                              Expanded(
                                                child: DragTarget(
                                                  builder: (context,
                                                      List<Object?>
                                                          candidateData,
                                                      rejectedData) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Toilet',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff073ea6),
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary:
                                                              Color(0xffffffff),

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    );
                                                  },
                                                  onWillAccept: (data) {
                                                    return true;
                                                  },
                                                  onAccept: (data) {
                                                    print("data $data");
                                                    setState(() {
                                                      if (data == "17") {
                                                        isSeventeenMatch = true;
                                                        score += 10;
                                                        chances -= 1;
                                                        print(
                                                            "CHANCES $chances");
                                                      } else {
                                                        if (score > 0) {
                                                          score -= 5;
                                                        }
                                                        isSeventeenColorRed =
                                                            true;
                                                        chances -= 1;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            if (isSeventeenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Toilet',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isSeventeenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Toilet',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),

                                      //5
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (!isTwentyMatch &&
                                                !isTwentyColorRed)
                                              Expanded(
                                                child: Draggable(
                                                  data: "20",
                                                  feedback: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Обмен валюты',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize:
                                                            Size(150, 52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  childWhenDragging:
                                                      Container(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new ElevatedButton(
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: new Text(
                                                          'Обмен валюты',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff073ea6),
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        //primary: Color(0xff072e79),
                                                        primary:
                                                            Color(0xffffffff),

                                                        minimumSize: Size(
                                                            double.infinity,
                                                            52),
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  100.0),
                                                          // side: BorderSide(color: Color(0xffffffff)),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isTwentyMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Обмен валюты',
                                                        style: TextStyle(
                                                          // color: Colors.green,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isTwentyColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Обмен валюты',
                                                        style: TextStyle(
                                                          // color: Colors.green,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (!isEighteenMatch &&
                                                !isEighteenColorRed)
                                              Expanded(
                                                child: DragTarget(
                                                  builder: (context,
                                                      List<Object?>
                                                          candidateData,
                                                      rejectedData) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Information',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff073ea6),
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary:
                                                              Color(0xffffffff),

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    );
                                                  },
                                                  onWillAccept: (data) {
                                                    return true;
                                                  },
                                                  onAccept: (data) {
                                                    print("data $data");
                                                    setState(() {
                                                      if (data == "18") {
                                                        isEighteenMatch = true;
                                                        score += 10;
                                                        chances -= 1;
                                                        print(
                                                            "CHANCES $chances");
                                                      } else {
                                                        if (score > 0) {
                                                          score -= 5;
                                                        }
                                                        isEighteenColorRed =
                                                            true;
                                                        chances -= 1;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            if (isEighteenMatch)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Information',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.green,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            if (isEighteenColorRed)
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: new ElevatedButton(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: new Text(
                                                        'Information',
                                                        style: TextStyle(
                                                          // color: Colors.transparent,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //primary: Color(0xff072e79),
                                                      primary: Colors.red,

                                                      minimumSize: Size(
                                                          double.infinity, 52),
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                100.0),
                                                        // side: BorderSide(color: Color(0xffffffff)),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ])
                                  : widget.stage == 5
                                      ? Column(children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!isTwentyOneMatch &&
                                                    !isTwentyOneColorRed)
                                                  Expanded(
                                                    child: Draggable(
                                                      data: "21",
                                                      feedback: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'К себе',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize:
                                                                Size(150, 52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                      childWhenDragging:
                                                          Container(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'К себе',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize: Size(
                                                                double.infinity,
                                                                52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyOneMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'К себе',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyOneColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'К себе',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (!isTwentyTwoMatch &&
                                                    !isTwentyTwoColorRed)
                                                  Expanded(
                                                    child: DragTarget(
                                                      builder: (context,
                                                          List<Object?>
                                                              candidateData,
                                                          rejectedData) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Push',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff073ea6),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary: Color(
                                                                  0xffffffff),

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        );
                                                      },
                                                      onWillAccept: (data) {
                                                        return true;
                                                      },
                                                      onAccept: (data) {
                                                        print("data $data");
                                                        setState(() {
                                                          if (data == "22") {
                                                            isTwentyTwoMatch =
                                                                true;
                                                            score += 10;
                                                            chances -= 1;

                                                            print(
                                                                "CHANCES $chances");
                                                          } else {
                                                            if (score > 0) {
                                                              score -= 5;
                                                            }
                                                            isTwentyTwoColorRed =
                                                                true;
                                                            chances -= 1;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (isTwentyTwoMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Push',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyTwoColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Push',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),

                                          //2
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!isTwentyTwoMatch &&
                                                    !isTwentyTwoColorRed)
                                                  Expanded(
                                                    child: Draggable(
                                                      data: "22",
                                                      feedback: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'От себя',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize:
                                                                Size(150, 52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                      childWhenDragging:
                                                          Container(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'От себя',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize: Size(
                                                                double.infinity,
                                                                52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyTwoMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            "От себя",
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyTwoColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'От себя',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (!isElevenMatch &&
                                                    !isElevenColorRed)
                                                  Expanded(
                                                    child: DragTarget(
                                                      builder: (context,
                                                          List<Object?>
                                                              candidateData,
                                                          rejectedData) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'banquet',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff073ea6),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary: Color(
                                                                  0xffffffff),

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        );
                                                      },
                                                      onWillAccept: (data) {
                                                        return true;
                                                      },
                                                      onAccept: (data) {
                                                        print("data $data");
                                                        setState(() {
                                                          if (data == "11") {
                                                            isElevenMatch =
                                                                true;
                                                            score += 10;
                                                            chances -= 1;
                                                            print(
                                                                "CHANCES $chances");
                                                          } else {
                                                            if (score > 0) {
                                                              score -= 5;
                                                            }
                                                            isElevenColorRed =
                                                                true;
                                                            chances -= 1;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (isElevenMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'banquet',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isElevenColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'banquet',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),

                                          //3
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!isTwentyThreeMatch &&
                                                    !isTwentyThreeColorRed)
                                                  Expanded(
                                                    child: Draggable(
                                                      data: "23",
                                                      feedback: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'банкет',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize:
                                                                Size(150, 52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                      childWhenDragging:
                                                          Container(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'Открыто',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize: Size(
                                                                double.infinity,
                                                                52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyThreeMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Открыто',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyThreeColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Открыто',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (!isTwentyFiveMatch &&
                                                    !isTwentyFiveColorRed)
                                                  Expanded(
                                                    child: DragTarget(
                                                      builder: (context,
                                                          List<Object?>
                                                              candidateData,
                                                          rejectedData) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Police',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff073ea6),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary: Color(
                                                                  0xffffffff),

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        );
                                                      },
                                                      onWillAccept: (data) {
                                                        return true;
                                                      },
                                                      onAccept: (data) {
                                                        print("data $data");
                                                        setState(() {
                                                          if (data == "25") {
                                                            isTwentyFiveMatch =
                                                                true;
                                                            score += 10;
                                                            chances -= 1;
                                                            print(
                                                                "CHANCES $chances");
                                                          } else {
                                                            if (score > 0) {
                                                              score -= 5;
                                                            }
                                                            isTwentyFiveColorRed =
                                                                true;
                                                            chances -= 1;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (isTwentyFiveMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Police',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyFiveColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Police',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),

                                          //4
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!isTwentyFourMatch &&
                                                    !isTwentyFourColorRed)
                                                  Expanded(
                                                    child: Draggable(
                                                      data: "24",
                                                      feedback: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'Закрыто',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize:
                                                                Size(150, 52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                      childWhenDragging:
                                                          Container(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'Закрыто',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize: Size(
                                                                double.infinity,
                                                                52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyFourMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Закрыто',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyFourColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Закрыто',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (!isTwentyOneMatch &&
                                                    !isTwentyOneColorRed)
                                                  Expanded(
                                                    child: DragTarget(
                                                      builder: (context,
                                                          List<Object?>
                                                              candidateData,
                                                          rejectedData) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Pull',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff073ea6),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary: Color(
                                                                  0xffffffff),

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        );
                                                      },
                                                      onWillAccept: (data) {
                                                        return true;
                                                      },
                                                      onAccept: (data) {
                                                        print("data $data");
                                                        setState(() {
                                                          if (data == "21") {
                                                            isTwentyOneMatch =
                                                                true;
                                                            score += 10;
                                                            chances -= 1;
                                                            print(
                                                                "CHANCES $chances");
                                                          } else {
                                                            if (score > 0) {
                                                              score -= 5;
                                                            }
                                                            isTwentyOneColorRed =
                                                                true;
                                                            chances -= 1;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (isTwentyOneMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Pull',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyOneColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Pull',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),

                                          //5
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (!isTwentyFiveMatch &&
                                                    !isTwentyFiveColorRed)
                                                  Expanded(
                                                    child: Draggable(
                                                      data: "25",
                                                      feedback: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'ПОЛИЦИЯ',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize:
                                                                Size(150, 52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                      childWhenDragging:
                                                          Container(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            new ElevatedButton(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child: new Text(
                                                              'ПОЛИЦИЯ',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff073ea6),
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            //primary: Color(0xff072e79),
                                                            primary: Color(
                                                                0xffffffff),

                                                            minimumSize: Size(
                                                                double.infinity,
                                                                52),
                                                            shape:
                                                                new RoundedRectangleBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      100.0),
                                                              // side: BorderSide(color: Color(0xffffffff)),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyFiveMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'ПОЛИЦИЯ',
                                                            style: TextStyle(
                                                              // color: Colors.green,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyFiveColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'ПОЛИЦИЯ',
                                                            style: TextStyle(
                                                              // color: Colors.green,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (!isTwentyThreeMatch &&
                                                    !isTwentyThreeColorRed)
                                                  Expanded(
                                                    child: DragTarget(
                                                      builder: (context,
                                                          List<Object?>
                                                              candidateData,
                                                          rejectedData) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Open',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff073ea6),
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary: Color(
                                                                  0xffffffff),

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        );
                                                      },
                                                      onWillAccept: (data) {
                                                        return true;
                                                      },
                                                      onAccept: (data) {
                                                        print("data $data");
                                                        setState(() {
                                                          if (data == "23") {
                                                            isTwentyThreeMatch =
                                                                true;
                                                            score += 10;
                                                            chances -= 1;
                                                            print(
                                                                "CHANCES $chances");
                                                          } else {
                                                            if (score > 0) {
                                                              score -= 5;
                                                            }
                                                            isTwentyThreeColorRed =
                                                                true;
                                                            chances -= 1;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (isTwentyThreeMatch)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Open',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.green,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                if (isTwentyThreeColorRed)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new ElevatedButton(
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 20),
                                                          child: new Text(
                                                            'Open',
                                                            style: TextStyle(
                                                              // color: Colors.transparent,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          //primary: Color(0xff072e79),
                                                          primary: Colors.red,

                                                          minimumSize: Size(
                                                              double.infinity,
                                                              52),
                                                          shape:
                                                              new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    100.0),
                                                            // side: BorderSide(color: Color(0xffffffff)),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ])
                                      : widget.stage == 6
                                          ? Column(children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (!isTwentySixMatch &&
                                                        !isTwentySixColorRed)
                                                      Expanded(
                                                        child: Draggable(
                                                          data: "26",
                                                          feedback: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'сто',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize:
                                                                    Size(150,
                                                                        52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          childWhenDragging:
                                                              Container(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'сто',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize: Size(
                                                                    double
                                                                        .infinity,
                                                                    52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySixMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'сто',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySixColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'сто',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (!isThirtyMatch &&
                                                        !isThirtyColorRed)
                                                      Expanded(
                                                        child: DragTarget(
                                                          builder: (context,
                                                              List<Object?>
                                                                  candidateData,
                                                              rejectedData) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  new ElevatedButton(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              20),
                                                                  child:
                                                                      new Text(
                                                                    'Frankfurt',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff073ea6),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  //primary: Color(0xff072e79),
                                                                  primary: Color(
                                                                      0xffffffff),

                                                                  minimumSize: Size(
                                                                      double
                                                                          .infinity,
                                                                      52),
                                                                  shape:
                                                                      new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            100.0),
                                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            );
                                                          },
                                                          onWillAccept: (data) {
                                                            return true;
                                                          },
                                                          onAccept: (data) {
                                                            print("data $data");
                                                            setState(() {
                                                              if (data ==
                                                                  "30") {
                                                                isThirtyMatch =
                                                                    true;
                                                                score += 10;
                                                                chances -= 1;

                                                                print(
                                                                    "CHANCES $chances");
                                                              } else {
                                                                if (score > 0) {
                                                                  score -= 5;
                                                                }
                                                                isThirtyColorRed =
                                                                    true;
                                                                chances -= 1;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    if (isThirtyMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Frankfurt',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isThirtyColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Frankfurt',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),

                                              //2
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (!isTwentySevenMatch &&
                                                        !isTwentySevenColorRed)
                                                      Expanded(
                                                        child: Draggable(
                                                          data: "27",
                                                          feedback: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'проспект',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize:
                                                                    Size(150,
                                                                        52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          childWhenDragging:
                                                              Container(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'проспект',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize: Size(
                                                                    double
                                                                        .infinity,
                                                                    52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySevenMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                "проспект",
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySevenColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'проспект',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (!isTwentyNineMatch &&
                                                        !isTwentyNineColorRed)
                                                      Expanded(
                                                        child: DragTarget(
                                                          builder: (context,
                                                              List<Object?>
                                                                  candidateData,
                                                              rejectedData) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  new ElevatedButton(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              20),
                                                                  child:
                                                                      new Text(
                                                                    'Saint-Petersburg',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff073ea6),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  //primary: Color(0xff072e79),
                                                                  primary: Color(
                                                                      0xffffffff),

                                                                  minimumSize: Size(
                                                                      double
                                                                          .infinity,
                                                                      52),
                                                                  shape:
                                                                      new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            100.0),
                                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            );
                                                          },
                                                          onWillAccept: (data) {
                                                            return true;
                                                          },
                                                          onAccept: (data) {
                                                            print("data $data");
                                                            setState(() {
                                                              if (data ==
                                                                  "29") {
                                                                isTwentyNineMatch =
                                                                    true;
                                                                score += 10;
                                                                chances -= 1;
                                                                print(
                                                                    "CHANCES $chances");
                                                              } else {
                                                                if (score > 0) {
                                                                  score -= 5;
                                                                }
                                                                isTwentyNineColorRed =
                                                                    true;
                                                                chances -= 1;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    if (isTwentyNineMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Saint-Petersburg',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyNineColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Saint-Petersburg',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),

                                              //3
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (!isTwentyEightMatch &&
                                                        !isTwentyEightColorRed)
                                                      Expanded(
                                                        child: Draggable(
                                                          data: "28",
                                                          feedback: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Женский',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize:
                                                                    Size(150,
                                                                        52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          childWhenDragging:
                                                              Container(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Женский',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize: Size(
                                                                    double
                                                                        .infinity,
                                                                    52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyEightMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Женский',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyEightColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Женский',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (!isTwentySixMatch &&
                                                        !isTwentySixColorRed)
                                                      Expanded(
                                                        child: DragTarget(
                                                          builder: (context,
                                                              List<Object?>
                                                                  candidateData,
                                                              rejectedData) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  new ElevatedButton(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              20),
                                                                  child:
                                                                      new Text(
                                                                    'one hundred',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff073ea6),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  //primary: Color(0xff072e79),
                                                                  primary: Color(
                                                                      0xffffffff),

                                                                  minimumSize: Size(
                                                                      double
                                                                          .infinity,
                                                                      52),
                                                                  shape:
                                                                      new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            100.0),
                                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            );
                                                          },
                                                          onWillAccept: (data) {
                                                            return true;
                                                          },
                                                          onAccept: (data) {
                                                            print("data $data");
                                                            setState(() {
                                                              if (data ==
                                                                  "26") {
                                                                isTwentySixMatch =
                                                                    true;
                                                                score += 10;
                                                                chances -= 1;
                                                                print(
                                                                    "CHANCES $chances");
                                                              } else {
                                                                if (score > 0) {
                                                                  score -= 5;
                                                                }
                                                                isTwentySixColorRed =
                                                                    true;
                                                                chances -= 1;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    if (isTwentySixMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'one hundred',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySixColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'one hundred',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),

                                              //4
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (!isTwentyNineMatch &&
                                                        !isTwentyNineColorRed)
                                                      Expanded(
                                                        child: Draggable(
                                                          data: "29",
                                                          feedback: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Санкт-Петербург',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize:
                                                                    Size(150,
                                                                        52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          childWhenDragging:
                                                              Container(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Санкт-Петербург',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize: Size(
                                                                    double
                                                                        .infinity,
                                                                    52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyNineMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Санкт-Петербург',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyNineColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Санкт-Петербург',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (!isTwentyEightMatch &&
                                                        !isTwentyEightColorRed)
                                                      Expanded(
                                                        child: DragTarget(
                                                          builder: (context,
                                                              List<Object?>
                                                                  candidateData,
                                                              rejectedData) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  new ElevatedButton(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              20),
                                                                  child:
                                                                      new Text(
                                                                    'Women',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff073ea6),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  //primary: Color(0xff072e79),
                                                                  primary: Color(
                                                                      0xffffffff),

                                                                  minimumSize: Size(
                                                                      double
                                                                          .infinity,
                                                                      52),
                                                                  shape:
                                                                      new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            100.0),
                                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            );
                                                          },
                                                          onWillAccept: (data) {
                                                            return true;
                                                          },
                                                          onAccept: (data) {
                                                            print("data $data");
                                                            setState(() {
                                                              if (data ==
                                                                  "28") {
                                                                isTwentyEightMatch =
                                                                    true;
                                                                score += 10;
                                                                chances -= 1;
                                                                print(
                                                                    "CHANCES $chances");
                                                              } else {
                                                                if (score > 0) {
                                                                  score -= 5;
                                                                }
                                                                isTwentyEightColorRed =
                                                                    true;
                                                                chances -= 1;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    if (isTwentyEightMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Women',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentyEightColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Women',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),

                                              //5
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (!isThirtyMatch &&
                                                        !isThirtyColorRed)
                                                      Expanded(
                                                        child: Draggable(
                                                          data: "30",
                                                          feedback: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Франкфурт',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize:
                                                                    Size(150,
                                                                        52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                          childWhenDragging:
                                                              Container(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                new ElevatedButton(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                child: new Text(
                                                                  'Франкфурт',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff073ea6),
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                //primary: Color(0xff072e79),
                                                                primary: Color(
                                                                    0xffffffff),

                                                                minimumSize: Size(
                                                                    double
                                                                        .infinity,
                                                                    52),
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                              .circular(
                                                                          100.0),
                                                                  // side: BorderSide(color: Color(0xffffffff)),
                                                                ),
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (isThirtyMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Франкфурт',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.green,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isThirtyColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Франкфурт',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.green,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (!isTwentySevenMatch &&
                                                        !isTwentySevenColorRed)
                                                      Expanded(
                                                        child: DragTarget(
                                                          builder: (context,
                                                              List<Object?>
                                                                  candidateData,
                                                              rejectedData) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  new ElevatedButton(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              20),
                                                                  child:
                                                                      new Text(
                                                                    'Avenue',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff073ea6),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  //primary: Color(0xff072e79),
                                                                  primary: Color(
                                                                      0xffffffff),

                                                                  minimumSize: Size(
                                                                      double
                                                                          .infinity,
                                                                      52),
                                                                  shape:
                                                                      new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            100.0),
                                                                    // side: BorderSide(color: Color(0xffffffff)),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            );
                                                          },
                                                          onWillAccept: (data) {
                                                            return true;
                                                          },
                                                          onAccept: (data) {
                                                            print("data $data");
                                                            setState(() {
                                                              if (data ==
                                                                  "27") {
                                                                isTwentySevenMatch =
                                                                    true;
                                                                score += 10;
                                                                chances -= 1;
                                                                print(
                                                                    "CHANCES $chances");
                                                              } else {
                                                                if (score > 0) {
                                                                  score -= 5;
                                                                }
                                                                isTwentySevenColorRed =
                                                                    true;
                                                                chances -= 1;
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    if (isTwentySevenMatch)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Avenue',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.green,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                    if (isTwentySevenColorRed)
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              new ElevatedButton(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: new Text(
                                                                'Avenue',
                                                                style:
                                                                    TextStyle(
                                                                  // color: Colors.transparent,
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              //primary: Color(0xff072e79),
                                                              primary:
                                                                  Colors.red,

                                                              minimumSize: Size(
                                                                  double
                                                                      .infinity,
                                                                  52),
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        100.0),
                                                                // side: BorderSide(color: Color(0xffffffff)),
                                                              ),
                                                            ),
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ])
                                          : widget.stage == 7 ?
                                         Column(
                                             children : [
                                           //1
                                           Container(
                                             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 if (!isThirtyOneMatch && !isThirtyOneColorRed)
                                                   Expanded(
                                                     child: Draggable(
                                                       data: "31",
                                                       feedback: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'одиннадцать',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(150, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                       childWhenDragging: Container(),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'одиннадцать',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(double.infinity, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyOneMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'одиннадцать',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyOneColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'одиннадцать',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (!isThirtyFourMatch && !isThirtyFourColorRed)
                                                   Expanded(
                                                     child: DragTarget(
                                                       builder: (context, List<Object?> candidateData,
                                                           rejectedData) {
                                                         return Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin:
                                                               EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Prague',
                                                                 style: TextStyle(
                                                                   color: Color(0xff073ea6),
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Color(0xffffffff),

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         );
                                                       },
                                                       onWillAccept: (data) {
                                                         return true;
                                                       },
                                                       onAccept: (data) {
                                                         print("data $data");
                                                         setState(() {
                                                           if (data == "34") {
                                                             isThirtyFourMatch = true;
                                                             score += 10;
                                                             chances -= 1;

                                                             print("CHANCES $chances");
                                                           } else {
                                                             if (score > 0) {
                                                               score -= 5;
                                                             }
                                                             isThirtyFourColorRed = true;
                                                             chances -= 1;
                                                           }
                                                         });
                                                       },
                                                     ),
                                                   ),
                                                 if (isThirtyFourMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Prague',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFourColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Prague',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                               ],
                                             ),
                                           ),

                                           //2
                                           Container(
                                             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 if (!isThirtyTwoMatch && !isThirtyTwoColorRed)
                                                   Expanded(
                                                     child: Draggable(
                                                       data: "32",
                                                       feedback: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Мужской',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(150, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                       childWhenDragging: Container(),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Мужской',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(double.infinity, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyTwoMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             "Мужской",
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyTwoColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Мужской',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (!isThirtyFiveMatch && !isThirtyFiveColorRed)
                                                   Expanded(
                                                     child: DragTarget(
                                                       builder: (context, List<Object?> candidateData,
                                                           rejectedData) {
                                                         return Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin:
                                                               EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Gomel',
                                                                 style: TextStyle(
                                                                   color: Color(0xff073ea6),
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Color(0xffffffff),

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         );
                                                       },
                                                       onWillAccept: (data) {
                                                         return true;
                                                       },
                                                       onAccept: (data) {
                                                         print("data $data");
                                                         setState(() {
                                                           if (data == "35") {
                                                             isThirtyFiveMatch = true;
                                                             score += 10;
                                                             chances -= 1;
                                                             print("CHANCES $chances");
                                                           } else {
                                                             if (score > 0) {
                                                               score -= 5;
                                                             }
                                                             isThirtyFiveColorRed = true;
                                                             chances -= 1;
                                                           }
                                                         });
                                                       },
                                                     ),
                                                   ),
                                                 if (isThirtyFiveMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Gomel',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFiveColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Gomel',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                               ],
                                             ),
                                           ),

                                           //3
                                           Container(
                                             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 if (!isThirtyThreeMatch && !isThirtyThreeColorRed)
                                                   Expanded(
                                                     child: Draggable(
                                                       data: "33",
                                                       feedback: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Женский',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(150, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                       childWhenDragging: Container(),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Женский',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(double.infinity, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyThreeMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Женский',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyThreeColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Женский',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (!isThirtyOneMatch && !isThirtyOneColorRed)
                                                   Expanded(
                                                     child: DragTarget(
                                                       builder: (context, List<Object?> candidateData,
                                                           rejectedData) {
                                                         return Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin:
                                                               EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Eleven',
                                                                 style: TextStyle(
                                                                   color: Color(0xff073ea6),
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Color(0xffffffff),

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         );
                                                       },
                                                       onWillAccept: (data) {
                                                         return true;
                                                       },
                                                       onAccept: (data) {
                                                         print("data $data");
                                                         setState(() {
                                                           if (data == "31") {
                                                             isThirtyOneMatch = true;
                                                             score += 10;
                                                             chances -= 1;
                                                             print("CHANCES $chances");
                                                           } else {
                                                             if (score > 0) {
                                                               score -= 5;
                                                             }
                                                             isThirtyOneColorRed = true;
                                                             chances -= 1;
                                                           }
                                                         });
                                                       },
                                                     ),
                                                   ),
                                                 if (isThirtyOneMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Eleven ',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyOneColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Eleven',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                               ],
                                             ),
                                           ),

                                           //4
                                           Container(
                                             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 if (!isThirtyFourMatch && !isThirtyFourColorRed)
                                                   Expanded(
                                                     child: Draggable(
                                                       data: "34",
                                                       feedback: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Прага',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(150, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                       childWhenDragging: Container(),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Прага',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(double.infinity, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFourMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Прага',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFourColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Прага',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (!isThirtyTwoMatch && !isThirtyTwoColorRed)
                                                   Expanded(
                                                     child: DragTarget(
                                                       builder: (context, List<Object?> candidateData,
                                                           rejectedData) {
                                                         return Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin:
                                                               EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Men',
                                                                 style: TextStyle(
                                                                   color: Color(0xff073ea6),
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Color(0xffffffff),

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         );
                                                       },
                                                       onWillAccept: (data) {
                                                         return true;
                                                       },
                                                       onAccept: (data) {
                                                         print("data $data");
                                                         setState(() {
                                                           if (data == "32") {
                                                             isThirtyTwoMatch = true;
                                                             score += 10;
                                                             chances -= 1;
                                                             print("CHANCES $chances");
                                                           } else {
                                                             if (score > 0) {
                                                               score -= 5;
                                                             }
                                                             isThirtyTwoColorRed = true;
                                                             chances -= 1;
                                                           }
                                                         });
                                                       },
                                                     ),
                                                   ),
                                                 if (isThirtyTwoMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Men',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyTwoColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Men',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                               ],
                                             ),
                                           ),

                                           //5
                                           Container(
                                             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 if (!isThirtyFiveMatch && !isThirtyFiveColorRed)
                                                   Expanded(
                                                     child: Draggable(
                                                       data: "35",
                                                       feedback: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Гомель',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(150, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                       childWhenDragging: Container(),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: new ElevatedButton(
                                                           child: Container(
                                                             margin: EdgeInsets.symmetric(vertical: 20),
                                                             child: new Text(
                                                               'Гомель',
                                                               style: TextStyle(
                                                                 color: Color(0xff073ea6),
                                                                 fontSize: 18,
                                                               ),
                                                             ),
                                                           ),
                                                           style: ElevatedButton.styleFrom(
                                                             //primary: Color(0xff072e79),
                                                             primary: Color(0xffffffff),

                                                             minimumSize: Size(double.infinity, 52),
                                                             shape: new RoundedRectangleBorder(
                                                               borderRadius:
                                                               new BorderRadius.circular(100.0),
                                                               // side: BorderSide(color: Color(0xffffffff)),
                                                             ),
                                                           ),
                                                           onPressed: () {},
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFiveMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Гомель',
                                                             style: TextStyle(
                                                               // color: Colors.green,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyFiveColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'Гомель',
                                                             style: TextStyle(
                                                               // color: Colors.green,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (!isThirtyThreeMatch && !isThirtyThreeColorRed)
                                                   Expanded(
                                                     child: DragTarget(
                                                       builder: (context, List<Object?> candidateData,
                                                           rejectedData) {
                                                         return Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin:
                                                               EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'lane',
                                                                 style: TextStyle(
                                                                   color: Color(0xff073ea6),
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Color(0xffffffff),

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         );
                                                       },
                                                       onWillAccept: (data) {
                                                         return true;
                                                       },
                                                       onAccept: (data) {
                                                         print("data $data");
                                                         setState(() {
                                                           if (data == "33") {
                                                             isThirtyThreeMatch = true;
                                                             score += 10;
                                                             chances -= 1;
                                                             print("CHANCES $chances");
                                                           } else {
                                                             if (score > 0) {
                                                               score -= 5;
                                                             }
                                                             isThirtyThreeColorRed = true;
                                                             chances -= 1;
                                                           }
                                                         });
                                                       },
                                                     ),
                                                   ),
                                                 if (isThirtyThreeMatch)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'lane',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.green,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                                 if (isThirtyThreeColorRed)
                                                   Expanded(
                                                     child: Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: new ElevatedButton(
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(vertical: 20),
                                                           child: new Text(
                                                             'lane',
                                                             style: TextStyle(
                                                               // color: Colors.transparent,
                                                               fontSize: 18,
                                                             ),
                                                           ),
                                                         ),
                                                         style: ElevatedButton.styleFrom(
                                                           //primary: Color(0xff072e79),
                                                           primary: Colors.red,

                                                           minimumSize: Size(double.infinity, 52),
                                                           shape: new RoundedRectangleBorder(
                                                             borderRadius:
                                                             new BorderRadius.circular(100.0),
                                                             // side: BorderSide(color: Color(0xffffffff)),
                                                           ),
                                                         ),
                                                         onPressed: () {},
                                                       ),
                                                     ),
                                                   ),
                                               ],
                                             ),
                                           ),
                                         ]
                                         ) :
                                         widget.stage == 8 ?
                                         Column(
                                             children : [

                                               //1
                                               Container(
                                                 margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                                 child: Row(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     if (!isThirtySixMatch && !isThirtySixColorRed)
                                                       Expanded(
                                                         child: Draggable(
                                                           data: "36",
                                                           feedback: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'Киев',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(150, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                           childWhenDragging: Container(),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'Киев',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(double.infinity, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySixMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Киев',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySixColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Киев',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (!isThirtyEightMatch && !isThirtyEightColorRed)
                                                       Expanded(
                                                         child: DragTarget(
                                                           builder: (context, List<Object?> candidateData,
                                                               rejectedData) {
                                                             return Padding(
                                                               padding: const EdgeInsets.all(8.0),
                                                               child: new ElevatedButton(
                                                                 child: Container(
                                                                   margin:
                                                                   EdgeInsets.symmetric(vertical: 20),
                                                                   child: new Text(
                                                                     'Three Hundred',
                                                                     style: TextStyle(
                                                                       color: Color(0xff073ea6),
                                                                       fontSize: 18,
                                                                     ),
                                                                   ),
                                                                 ),
                                                                 style: ElevatedButton.styleFrom(
                                                                   //primary: Color(0xff072e79),
                                                                   primary: Color(0xffffffff),

                                                                   minimumSize: Size(double.infinity, 52),
                                                                   shape: new RoundedRectangleBorder(
                                                                     borderRadius:
                                                                     new BorderRadius.circular(100.0),
                                                                     // side: BorderSide(color: Color(0xffffffff)),
                                                                   ),
                                                                 ),
                                                                 onPressed: () {},
                                                               ),
                                                             );
                                                           },
                                                           onWillAccept: (data) {
                                                             return true;
                                                           },
                                                           onAccept: (data) {
                                                             print("data $data");
                                                             setState(() {
                                                               if (data == "38") {
                                                                 isThirtyEightMatch = true;
                                                                 score += 10;
                                                                 chances -= 1;

                                                                 print("CHANCES $chances");
                                                               } else {
                                                                 if (score > 0) {
                                                                   score -= 5;
                                                                 }
                                                                 isThirtyEightColorRed = true;
                                                                 chances -= 1;
                                                               }
                                                             });
                                                           },
                                                         ),
                                                       ),
                                                     if (isThirtyEightMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Three Hundred',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyEightColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Three Hundred',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                   ],
                                                 ),
                                               ),

                                               //2
                                               Container(
                                                 margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                                 child: Row(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     if (!isThirtySevenMatch && !isThirtySevenColorRed)
                                                       Expanded(
                                                         child: Draggable(
                                                           data: "37",
                                                           feedback: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'восемнадцать',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(150, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                           childWhenDragging: Container(),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'восемнадцать',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(double.infinity, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySevenMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 "восемнадцать",
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySevenColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'восемнадцать',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (!isThirtySixMatch && !isThirtySixColorRed)
                                                       Expanded(
                                                         child: DragTarget(
                                                           builder: (context, List<Object?> candidateData,
                                                               rejectedData) {
                                                             return Padding(
                                                               padding: const EdgeInsets.all(8.0),
                                                               child: new ElevatedButton(
                                                                 child: Container(
                                                                   margin:
                                                                   EdgeInsets.symmetric(vertical: 20),
                                                                   child: new Text(
                                                                     'Kiev',
                                                                     style: TextStyle(
                                                                       color: Color(0xff073ea6),
                                                                       fontSize: 18,
                                                                     ),
                                                                   ),
                                                                 ),
                                                                 style: ElevatedButton.styleFrom(
                                                                   //primary: Color(0xff072e79),
                                                                   primary: Color(0xffffffff),

                                                                   minimumSize: Size(double.infinity, 52),
                                                                   shape: new RoundedRectangleBorder(
                                                                     borderRadius:
                                                                     new BorderRadius.circular(100.0),
                                                                     // side: BorderSide(color: Color(0xffffffff)),
                                                                   ),
                                                                 ),
                                                                 onPressed: () {},
                                                               ),
                                                             );
                                                           },
                                                           onWillAccept: (data) {
                                                             return true;
                                                           },
                                                           onAccept: (data) {
                                                             print("data $data");
                                                             setState(() {
                                                               if (data == "36") {
                                                                 isThirtySixMatch = true;
                                                                 score += 10;
                                                                 chances -= 1;
                                                                 print("CHANCES $chances");
                                                               } else {
                                                                 if (score > 0) {
                                                                   score -= 5;
                                                                 }
                                                                 isThirtySixColorRed = true;
                                                                 chances -= 1;
                                                               }
                                                             });
                                                           },
                                                         ),
                                                       ),
                                                     if (isThirtySixMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Kiev',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySixColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'Kiev',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                   ],
                                                 ),
                                               ),

                                               //3
                                               Container(
                                                 margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                                 child: Row(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     if (!isThirtyEightMatch && !isThirtyEightColorRed)
                                                       Expanded(
                                                         child: Draggable(
                                                           data: "38",
                                                           feedback: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'триста',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(150, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                           childWhenDragging: Container(),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'триста',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(double.infinity, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyEightMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'триста',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyEightColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'триста',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (!isThirtyNineMatch && !isThirtyNineColorRed)
                                                       Expanded(
                                                         child: DragTarget(
                                                           builder: (context, List<Object?> candidateData,
                                                               rejectedData) {
                                                             return Padding(
                                                               padding: const EdgeInsets.all(8.0),
                                                               child: new ElevatedButton(
                                                                 child: Container(
                                                                   margin:
                                                                   EdgeInsets.symmetric(vertical: 20),
                                                                   child: new Text(
                                                                     'two thousand',
                                                                     style: TextStyle(
                                                                       color: Color(0xff073ea6),
                                                                       fontSize: 18,
                                                                     ),
                                                                   ),
                                                                 ),
                                                                 style: ElevatedButton.styleFrom(
                                                                   //primary: Color(0xff072e79),
                                                                   primary: Color(0xffffffff),

                                                                   minimumSize: Size(double.infinity, 52),
                                                                   shape: new RoundedRectangleBorder(
                                                                     borderRadius:
                                                                     new BorderRadius.circular(100.0),
                                                                     // side: BorderSide(color: Color(0xffffffff)),
                                                                   ),
                                                                 ),
                                                                 onPressed: () {},
                                                               ),
                                                             );
                                                           },
                                                           onWillAccept: (data) {
                                                             return true;
                                                           },
                                                           onAccept: (data) {
                                                             print("data $data");
                                                             setState(() {
                                                               if (data == "39") {
                                                                 isThirtyNineMatch = true;
                                                                 score += 10;
                                                                 chances -= 1;
                                                                 print("CHANCES $chances");
                                                               } else {
                                                                 if (score > 0) {
                                                                   score -= 5;
                                                                 }
                                                                 isThirtyNineColorRed = true;
                                                                 chances -= 1;
                                                               }
                                                             });
                                                           },
                                                         ),
                                                       ),
                                                     if (isThirtyNineMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'two thousand',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyNineColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'two thousand',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                   ],
                                                 ),
                                               ),

                                               //4

                                               Container(
                                                 margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                                 child: Row(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     if (!isThirtyNineMatch && !isThirtyNineColorRed)
                                                       Expanded(
                                                         child: Draggable(
                                                           data: "39",
                                                           feedback: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'две тысячи',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(150, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                           childWhenDragging: Container(),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: new ElevatedButton(
                                                               child: Container(
                                                                 margin: EdgeInsets.symmetric(vertical: 20),
                                                                 child: new Text(
                                                                   'две тысячи',
                                                                   style: TextStyle(
                                                                     color: Color(0xff073ea6),
                                                                     fontSize: 18,
                                                                   ),
                                                                 ),
                                                               ),
                                                               style: ElevatedButton.styleFrom(
                                                                 //primary: Color(0xff072e79),
                                                                 primary: Color(0xffffffff),

                                                                 minimumSize: Size(double.infinity, 52),
                                                                 shape: new RoundedRectangleBorder(
                                                                   borderRadius:
                                                                   new BorderRadius.circular(100.0),
                                                                   // side: BorderSide(color: Color(0xffffffff)),
                                                                 ),
                                                               ),
                                                               onPressed: () {},
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyNineMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'две тысячи',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtyNineColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'две тысячи',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (!isThirtySevenMatch && !isThirtySevenColorRed)
                                                       Expanded(
                                                         child: DragTarget(
                                                           builder: (context, List<Object?> candidateData,
                                                               rejectedData) {
                                                             return Padding(
                                                               padding: const EdgeInsets.all(8.0),
                                                               child: new ElevatedButton(
                                                                 child: Container(
                                                                   margin:
                                                                   EdgeInsets.symmetric(vertical: 20),
                                                                   child: new Text(
                                                                     'eighteen',
                                                                     style: TextStyle(
                                                                       color: Color(0xff073ea6),
                                                                       fontSize: 18,
                                                                     ),
                                                                   ),
                                                                 ),
                                                                 style: ElevatedButton.styleFrom(
                                                                   //primary: Color(0xff072e79),
                                                                   primary: Color(0xffffffff),

                                                                   minimumSize: Size(double.infinity, 52),
                                                                   shape: new RoundedRectangleBorder(
                                                                     borderRadius:
                                                                     new BorderRadius.circular(100.0),
                                                                     // side: BorderSide(color: Color(0xffffffff)),
                                                                   ),
                                                                 ),
                                                                 onPressed: () {},
                                                               ),
                                                             );
                                                           },
                                                           onWillAccept: (data) {
                                                             return true;
                                                           },
                                                           onAccept: (data) {
                                                             print("data $data");
                                                             setState(() {
                                                               if (data == "37") {
                                                                 isThirtySevenMatch = true;
                                                                 score += 10;
                                                                 chances -= 1;
                                                                 print("CHANCES $chances");
                                                               } else {
                                                                 if (score > 0) {
                                                                   score -= 5;
                                                                 }
                                                                 isThirtySevenColorRed = true;
                                                                 chances -= 1;
                                                               }
                                                             });
                                                           },
                                                         ),
                                                       ),
                                                     if (isThirtySevenMatch)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'eighteen',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.green,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                     if (isThirtySevenColorRed)
                                                       Expanded(
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: new ElevatedButton(
                                                             child: Container(
                                                               margin: EdgeInsets.symmetric(vertical: 20),
                                                               child: new Text(
                                                                 'eighteen',
                                                                 style: TextStyle(
                                                                   // color: Colors.transparent,
                                                                   fontSize: 18,
                                                                 ),
                                                               ),
                                                             ),
                                                             style: ElevatedButton.styleFrom(
                                                               //primary: Color(0xff072e79),
                                                               primary: Colors.red,

                                                               minimumSize: Size(double.infinity, 52),
                                                               shape: new RoundedRectangleBorder(
                                                                 borderRadius:
                                                                 new BorderRadius.circular(100.0),
                                                                 // side: BorderSide(color: Color(0xffffffff)),
                                                               ),
                                                             ),
                                                             onPressed: () {},
                                                           ),
                                                         ),
                                                       ),
                                                   ],
                                                 ),
                                               ),
                                             ]
                                         )
                                         : Container(),



                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: new Text(
                      'I don\'t know',
                      style: TextStyle(
                          color: Color(0xff3bd854),
                          fontSize: 18,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                    child: LinearProgressIndicator(
                      //value: controller.value,
                      color: Color(0xff3bd854),
                      backgroundColor: Color(0xff073ea6),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
