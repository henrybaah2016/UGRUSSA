import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ugrussa/game/game_board.dart';
import 'package:ugrussa/game/game_player.dart';

final List<String> imgList = [
  'assets/images/cartoon_male.png',
];

class GameScore extends StatefulWidget {
  int? score;

  GameScore({Key? key,this.score}) : super(key: key);

  @override
  _GameScoreState createState() => _GameScoreState();
}

class _GameScoreState extends State<GameScore> {
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
          child: Column(children: <Widget>[
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
                              child: Image.asset(
                            item,
                            fit: BoxFit.contain,
                          )),
                        ))
                    .toList(),
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: new Text(
                    'You Got a score of ${widget.score! < 0 ? 0 : widget.score} / 50',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: new Text(
                    'Do you want to play the puzzle game again?',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 70, right: 30, left: 30),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScore()),
                  );
                },
                child: new Text(
                  'Replay',
                  style: TextStyle(color: Color(0xffffffff), fontSize: 18),
                ),
              ),
            ),
          ]),
        ));
  }
}
