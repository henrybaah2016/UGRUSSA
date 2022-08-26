import 'package:flutter/material.dart';
import 'package:ugrussa/game/game_board.dart';

class ChooseStageScreen extends StatelessWidget {
  const ChooseStageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3bd854),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                LinearProgressIndicator(
                  //value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                  color: Color(0xffffffff),
                  backgroundColor: Color(0xff073ea6),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 1,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage One",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(stage: 2),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Two",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 3,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Three",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 4,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Four",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 5,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Five",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 6,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Six",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 7,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Seven",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameBoard(
                          stage: 8,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xbe072e79),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Stage Eight",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                LinearProgressIndicator(
                  //value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                  color: Color(0xffffffff),
                  backgroundColor: Color(0xff073ea6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
