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
  int score = 0;
  int chances = 5;

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
        child: chances == 0
            ? AlertDialog(
                title: Text("Game Over"),
                content: Text(''),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
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
                             'Match Words',
                             style:
                                 TextStyle(color: Color(0xffffffff), fontSize: 18),
                           ),
                         ),
                       ),

                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isThreeMatch)
                          Expanded(
                            child: Draggable(
                              data: "3",
                              feedback: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: new Text(
                                      'Food',
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
                                      'Food',
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
                        if (isThreeMatch)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new ElevatedButton(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isOneMatch)
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
                                        'Bag',
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
                                  if (data == "1") {
                                    isOneMatch = true;
                                    score += 10;
                                    chances -= 1;

                                    print("CHANCES $chances");
                                  } else {
                                    score -= 5;
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
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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

                  //two
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!isTwoMatch)
                          Expanded(
                            child: Draggable(
                              data: "2",
                              feedback: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: new Text(
                                      'Yeda',
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
                                      'Yeda',
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
                        if (isTwoMatch)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new ElevatedButton(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isTwoMatch)
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
                                        'Cloth',
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
                                  if (data == "2") {
                                    isTwoMatch = true;
                                    score += 10;
                                    chances -= 1;
                                    print("CHANCES $chances");
                                  } else {
                                    score -= 5;
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
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isOneMatch)
                          Expanded(
                            child: Draggable(
                              data: "1",
                              feedback: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: new Text(
                                      'kniga',
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
                                      'kniga',
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
                        if (isOneMatch)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new ElevatedButton(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isThreeMatch)
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
                                        'Ethhs',
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
                                  if (data == "3") {
                                    isThreeMatch = true;
                                    score += 10;
                                    chances -= 1;
                                    print("CHANCES $chances");
                                  } else {
                                    score -= 5;
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
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isFiveMatch)
                          Expanded(
                            child: Draggable(
                              data: "5",
                              feedback: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: new Text(
                                      'ruchka',
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
                                      'ruchka',
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
                        if (isFiveMatch)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new ElevatedButton(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isFourMatch)
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
                                        'Book',
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
                                  if (data == "4") {
                                    isFourMatch = true;
                                    score += 10;
                                    chances -= 1;
                                    print("CHANCES $chances");
                                  } else {
                                    score -= 5;
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
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isFourMatch)
                          Expanded(
                            child: Draggable(
                              data: "4",
                              feedback: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new ElevatedButton(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: new Text(
                                      'Novyy',
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
                                      'hurf',
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
                        if (isFourMatch)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new ElevatedButton(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
                        if (!isFiveMatch)
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
                                        'New',
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
                                  if (data == "5") {
                                    isFiveMatch = true;
                                    score += 10;
                                    chances -= 1;
                                    print("CHANCES $chances");
                                  } else {
                                    score -= 5;
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
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: new Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Color(0xff072e79),
                                  primary: Colors.transparent,

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
