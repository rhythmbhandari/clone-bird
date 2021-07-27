import 'dart:async';

import 'package:clone_bird/clonebird.dart';
import 'package:clone_bird/obstacles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double cloneYaxis = 0;
  double cloneXaxis = 0;
  double obstacleX1 = 1;
  double obstacleX2 = 2;
  double obstacleX3 = 3;
  double obstacleX4 = 4;
  double obstacleX5 = 5;
  double initialHeight = 0;
  double height = 0;
  double time = 0;
  double gravity = -4.5;
  double velocity = 2.2;
  double scoreCounter = 0;
  bool gameStarted = false;

  void fly() {
    setState(() {
      initialHeight = cloneYaxis;
      time = 0;
    });
  }

  void startGame() {
    gameStarted = true;
    initialHeight = cloneYaxis;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = gravity * time * time + velocity * time;
      setState(() {
        cloneYaxis = initialHeight - height;
      });
      setState(() {
        if (obstacleX1 < -2) {
          obstacleX1 += 5 ;
        } else {
          obstacleX1 -= 0.05;
        }
      });
      setState(() {
        if (obstacleX2 < -2) {
          obstacleX2 += 5;
        } else {
          obstacleX2 -= 0.05;
        }
      });
      setState(() {
        if (obstacleX3 < -2) {
          obstacleX3 += 5;
        } else {
          obstacleX3 -= 0.05;
        }
      });
      setState(() {
        if (obstacleX4 < -2) {
          obstacleX4 += 5;
        } else {
          obstacleX4 -= 0.05;
        }
      });
      setState(() {
        if (obstacleX5 < -2) {
          obstacleX5 += 5;
        } else {
          obstacleX5 -= 0.05;
        }
      });
      if (gameOver()){
        timer.cancel();
        gameStarted = false;
        _showDialog();
      }

      time += 0.01;
    });
  }

  bool gameOver(){
    if (cloneYaxis > 1 || cloneYaxis < -1) {
        return true;
      }else {
        return false;
      }
  }

  void resetGame(){
    Navigator.pop(context);
    setState(() {
      cloneYaxis = 0;
      gameStarted = false;
      time = 0;
      initialHeight = cloneYaxis;
    });
  }

  void _showDialog(){
    showDialog(context: context, 
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: Center(  
          child: Text(
            "GAME OVER", 
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: resetGame,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.all(7),
                color: Colors.white,
                child: Text('TRY AGAIN',
                style:TextStyle(color: Colors.grey.shade900),
                ),
              ),
            ),
          ),
        ],
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameStarted) {
          fly();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 17,
              decoration: BoxDecoration(
                color: Color.fromRGBO(68, 61, 76, 1),
                border: Border.all(width: 7, color: Colors.grey.shade900),
              ),
            ),
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(cloneXaxis, cloneYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Color.fromRGBO(223, 41, 38, 100),
                      child: CloneBird(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.2),
                      child: gameStarted
                          ? Text(" ")
                          : Text("T A P",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX1, 1),
                      child: Obstacles(
                        oHeight: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX1, -1),
                      child: Obstacles(
                        oHeight: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX2, 1),
                      child: Obstacles(
                        oHeight: 230.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX2, -1),
                      child: Obstacles(
                        oHeight: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX3, 1),
                      child: Obstacles(
                        oHeight: 270.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX3, -1),
                      child: Obstacles(
                        oHeight: 120.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX4, 1),
                      child: Obstacles(
                        oHeight: 210.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX4, -1),
                      child: Obstacles(
                        oHeight: 190.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX5, 1),
                      child: Obstacles(
                        oHeight: 290.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(obstacleX5, -1),
                      child: Obstacles(
                        oHeight: 100.0,
                      ),
                    ),
                  ],
                )),
            Container(
              height: 17,
              decoration: BoxDecoration(
                color: Color.fromRGBO(68, 61, 76, 1),
                border: Border.all(width: 7, color: Colors.grey.shade900),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple[600],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(height: 20),
                        Text("4",
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("PRIME",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(height: 20),
                        Text("120",
                            style:
                                TextStyle(color: Colors.white, fontSize: 40)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
