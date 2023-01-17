import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoee/size_config.dart';

import 'controller.dart/homeController.dart';

class TicTacContainer extends StatefulWidget {
  TicTacContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TicTacContainer> createState() => _TicTacContainerState();
}

class _TicTacContainerState extends State<TicTacContainer> {
  final HomeController homeController = Get.put(HomeController());

  bool oTurn = true;
  int filleBox = 0;
  // int playerOScore = 0;
  // int playerXScore = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46 * SizeConfig.heightMultiplier,
          width: 88 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            //color: Colors.deepPurple[800],
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(
            //     color: Color.fromARGB(255, 199, 167, 255),
            //     width: 0.8 * SizeConfig.widthMultiplier),
          ),
          child: GridView.builder(
              itemCount: homeController.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.09,
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //   color: Colors.amber,
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 96, 33, 91),
                          border: Border.all(
                        color: Color.fromARGB(255, 199, 167, 255),
                      )),
                      child: Center(
                          child: Text(
                        homeController.items[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 5 * SizeConfig.heightMultiplier,
                          color: homeController.items[index] == 'O'
                              ? Color.fromARGB(255, 251, 104, 153)
                              : Color.fromARGB(255, 56, 215, 255),
                        ),
                      )),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  void _tapped(int index) {
    setState(() {
      if (homeController.items[index] != 'O' &&
          homeController.items[index] != 'X') {
        if (oTurn == true) {
          homeController.items[index] = 'O';
          filleBox += 1;
        } else {
          homeController.items[index] = 'X';
          filleBox += 1;
        }
        oTurn = !oTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    if (homeController.items[0] == homeController.items[1] &&
        homeController.items[0] == homeController.items[2] &&
        homeController.items[0] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[3] == homeController.items[4] &&
        homeController.items[3] == homeController.items[5] &&
        homeController.items[3] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[6] == homeController.items[7] &&
        homeController.items[6] == homeController.items[8] &&
        homeController.items[6] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[0] == homeController.items[3] &&
        homeController.items[0] == homeController.items[6] &&
        homeController.items[0] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[1] == homeController.items[4] &&
        homeController.items[1] == homeController.items[7] &&
        homeController.items[1] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[2] == homeController.items[5] &&
        homeController.items[2] == homeController.items[8] &&
        homeController.items[2] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[0] == homeController.items[4] &&
        homeController.items[0] == homeController.items[8] &&
        homeController.items[0] != '') {
      _showWinner(oTurn);
    }
    if (homeController.items[6] == homeController.items[4] &&
        homeController.items[6] == homeController.items[2] &&
        homeController.items[6] != '') {
      _showWinner(oTurn);
    } else if (filleBox == 9) {
      draw();
    }
  }

  void draw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 24, 74),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Color.fromARGB(255, 176, 136, 247),
                      width: 0.8 * SizeConfig.widthMultiplier)),
              height: 20 * SizeConfig.heightMultiplier,
              width: 70 * SizeConfig.widthMultiplier,
              child: Column(
                children: [
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    'Game is Tie',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * SizeConfig.heightMultiplier),
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                  GestureDetector(
                    onTap: () {
                      _clearBoard();
                      Get.back();
                    },
                    child: Container(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 14 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color.fromARGB(255, 146, 255, 150),
                                width: 0.5 * SizeConfig.widthMultiplier)),
                        child: Image.asset(
                          'images/2.png',
                          height: 10 * SizeConfig.heightMultiplier,
                        )),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          );
        });

    //
  }

  void _showWinner(bool Turn) {
    print('condition check ${Turn}');
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return
              //  title: Turn == true ? Text('Winner is X') : Text('Winner is O'),
              // title: Text(Turn == true ? 'Winner is X' : 'Winner is O'),
              AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 24, 74),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Color.fromARGB(255, 176, 136, 247),
                      width: 0.8 * SizeConfig.widthMultiplier)),
              height: 20 * SizeConfig.heightMultiplier,
              width: 70 * SizeConfig.widthMultiplier,
              child: Column(
                children: [
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    Turn == true ? 'Winner is X' : 'Winner is O',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * SizeConfig.heightMultiplier),
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                  GestureDetector(
                    onTap: () {
                      _clearBoard();
                      Get.back();
                    },
                    child: Container(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 14 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color.fromARGB(255, 146, 255, 150),
                                width: 0.5 * SizeConfig.widthMultiplier)),
                        child: Image.asset(
                          'images/2.png',
                          height: 10 * SizeConfig.heightMultiplier,
                        )),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          );
        });

    if (Turn == true) {
      homeController.playerXScore += 1;
    } else if (Turn == false) {
      homeController.playerOScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i <= 8; i++) {
        homeController.items[i] = '';
      }
    });
    filleBox = 0;
  }
}
