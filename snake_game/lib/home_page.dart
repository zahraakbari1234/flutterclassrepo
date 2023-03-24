import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snake_game/blank_pixel.dart';
import 'package:snake_game/snake_pixel.dart';
import 'food_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum SnakeDirection{up,down,right,left}


class _HomePageState extends State<HomePage> {

  int rowSize = 10;
  int TotalNumberOFSquares = 100;
  bool _isFistTimePressed = true;
  List<int> snakePos = [0 , 1 , 2];
  int foodPos = 55 ;
  var currentDirection = SnakeDirection.right;
  int currentScore = 0 ;

  void startGame (){
    _isFistTimePressed = false ;
    Timer.periodic(  const Duration(milliseconds: 300), (timer) {
      setState(() {
        moveSnake();
        if(gameOver()){
          print('game over');
          timer.cancel();

          showDialog(context: context, builder: (context){
            return  AlertDialog(
              title: const Text('GAME OVER'),
              content: Text( "your current score is $currentScore") ,

            );
          });
        }
      });
    });
  }

  void eatFood(){
    while(snakePos.contains(foodPos)){
      currentScore ++;
      foodPos = Random().nextInt(TotalNumberOFSquares);

    }
  }

  bool gameOver (){
    List<int> snakeBody = snakePos.sublist(0 , snakePos.length - 1);
    if(snakeBody.contains(snakePos.last)){
      return true;
    }
      return false ;
  }

  void moveSnake () {
    switch (currentDirection) {
      case SnakeDirection.right:
        {
          if (snakePos.last % rowSize == 9) {
            snakePos.add(snakePos.last + 1 - rowSize);
          }
          else {
            snakePos.add(snakePos.last + 1);
          }
        }
        break;
      case SnakeDirection.left:
        {
          if (snakePos.last % rowSize == 0) {
            snakePos.add(snakePos.last - 1 + rowSize);
          }
          else {
            snakePos.add(snakePos.last - 1);
          }
        }
        break;
      case SnakeDirection.up:
        {
          if (snakePos.last < rowSize) {
            snakePos.add(snakePos.last - rowSize + TotalNumberOFSquares);
          }
          else {
            snakePos.add(snakePos.last - rowSize);
          }
        }
        break;
      case SnakeDirection.down:
        {
          if (snakePos.last + rowSize > TotalNumberOFSquares) {
            snakePos.add(snakePos.last + rowSize - TotalNumberOFSquares);
          }
          else {
            snakePos.add(snakePos.last + rowSize);
          }
        }
        break;
      default:
    }

    if(snakePos.last == foodPos){
      eatFood();
    }else{
      snakePos.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("current score"),
                      Text(currentScore.toString(),
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onVerticalDragUpdate: (details){

              //برای اینکه نتونه توی مسیر رفت برعکس بشه
              //&& currentDirection!= SnakeDirection.up
              if(details.delta.dy > 0 && currentDirection!= SnakeDirection.up){
                currentDirection = SnakeDirection.down;
              }else if(details.delta.dy < 0 && currentDirection!= SnakeDirection.down)
                {
                  currentDirection = SnakeDirection.up;
                }
            },

            onHorizontalDragUpdate: (details){
              if(details.delta.dx > 0 && currentDirection!= SnakeDirection.left){
                currentDirection = SnakeDirection.right;
              }else if(details.delta.dx < 0 && currentDirection!= SnakeDirection.right)
              {
                currentDirection = SnakeDirection.left;
              }
            },
            child: GridView.builder(
              gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowSize),
              itemCount: 100,
              physics: const NeverScrollableScrollPhysics(),

              //to do work on every grid
              itemBuilder: ( context,  index) {
                if (snakePos.contains(index)){
                  return const SnakePixel();
                }
                else if(foodPos == index){
                  return const FoodPixel();
                }
                else {
                    return const BlankPixel();
                  }
              }),
          ),
        ),
        Expanded(
          child: Center(
            child: MaterialButton(
              onPressed: (){

                //اگر این نباشد چند بار پشت هم دکمه فشار داده شود هرسری سرعت حرکت کرم میره بالاتر
                if( _isFistTimePressed == true){
                  startGame();
                }
              },
              color: Colors.pink,
              child: const Text("play"),
            ),
          ),
        ),
      ],
    );
  }
}
